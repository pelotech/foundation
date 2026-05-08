# Gateway Migration Steps

## Initial Per-Cluster Steps

Each numbered step should be a discrete PR.

1. In the `infrastructure` `AppProject` (`_base/resources.yaml`) add the following to `spec.destinations`:

``` yaml
    - namespace: envoy-gateway-system
      server: https://kubernetes.default.svc
```

In Argo (`argocd` application), check the  `infrastructure` `AppProject` is healthy and updated.

2. Install Envoy Gateway
    * In `kustomization.yaml`, add `https://github.com/pelotech/foundation//gitops/components/envoy-gateway?ref=v4.3.3` to the `components` array, replacing the version with the current version
    * In `_base/environment.yaml` add `EG_NLB_NAME: "eg-CLUSTER-NAME"` (subbing in your `CLUSTER-NAME`, e.g. `eg-foundation-nonprod`) to the `kustomize-environment` `ConfigMap`
    * In `rbac.yaml` in the `viewonly-access` `ClusterRole`, add the following values to the `rules.apiGroups` array:

``` yaml
      - gateway.envoyproxy.io
      - gateway.networking.k8s.io
```

In Argo (`argocd` application), ensure your `GatewayClass` and `EnvoyProxy` objects exist and are healthy. You may also want to check the updated `ConfigMap` and `ClusterRole`.

3. Create a Gateway and update controllers (these could be split up into multiple PRs if desired)
    * Add `async-cluster-configuration/resources/envoy-gateway.yaml`

``` yaml
apiVersion: gateway.networking.k8s.io/v1
kind: Gateway
metadata:
  name: eg
  namespace: envoy-gateway-system
spec:
  gatewayClassName: eg
  allowedListeners:
    namespaces:
      from: All
  # keep this placeholder until https://github.com/kubernetes-sigs/gateway-api/issues/4425 is resolved
  listeners:
    - name: placeholder
      port: 65535
      protocol: HTTP
      hostname: placeholder.invalid
      allowedRoutes:
        namespaces:
          from: Selector
          selector:
            matchLabels:
              placeholder: placeholder
```

#### Gateway Certificate Challenge (ACME Solver)

If you are using Let's Encrypt for certificates and are planning to use [`gatewayHTTPRoute`](https://github.com/pelotech/foundation/blob/688e1b6c97113b6183f93f6a21208f594daa5519/gitops/components/cert-manager/create-issuer/templates/create-issuer.yaml#L24) for your solver, listeners should be replaced with the following:

``` yaml
  listeners:
    - name: acme-solver
      port: 80
      protocol: HTTP
      allowedRoutes:
        namespaces:
          from: All
```

* Add `- resources/envoy-gateway.yaml` to the `resources` array in `async-cluster-configuration/kustomization.yaml`:

* Create `_base/overlays/cert-manager-patch.yaml` with the following values:


``` yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: cert-manager
spec:
  source:
    helm:
      valuesObject:
        config:
          enableGatewayAPI: true
          enableGatewayAPIListenerSet: true
          featureGates:
            ListenerSets: true
```

* Create `_base/overlays/external-dns-patch.yaml` with the following values:

``` yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: external-dns
spec:
  source:
    helm:
      valuesObject:
        sources:
          - service
          - ingress
          - gateway-httproute
        enableGatewayListenerSets: true
```

* In `kustomization.yaml`, add the following to the `patches` array:

``` yaml
  - target:
      group: argoproj.io
      version: v1alpha1
      kind: Application
      name: cert-manager
    path: _base/overlays/cert-manager-patch.yaml
  - target:
      group: argoproj.io
      version: v1alpha1
      kind: Application
      name: external-dns
    path: _base/overlays/external-dns-patch.yaml
```

In Argo (`async-cluster-configuration` application), ensure your `Gateway` object exists and is healthy. You may also want to check the `cert-manager` and `external-dns` applications.

In AWS, in the EC2 page, ensure your new load balancer exists. If you have a `Listener` on port 80 for Let's Encrypt, you can ensure a `Listener` exists with at least one `Healthy` `Target Group` (it is OK to have unhealthy `Target Groups` as long as one is healthy).

## Namespaces/Application Steps

Using Helm, you can create [HTTPRoutes](https://gateway-api.sigs.k8s.io/api-types/httproute/) and [ListenerSets](https://gateway-api.sigs.k8s.io/guides/listener-set/) per hostname. This is a preferred pattern instead of needing to define hostnames at the Gateway level AND HTTPRoute level. This allows application developers to create hostnames without touching Cluster level resources (i.e. Gateway). See more info from the [Gateway Introduction docs](https://gateway-api.sigs.k8s.io/).

You may want to use [weighted routing](#external-dns-annotations) to ensure a clean cutover from `Ingress` to `Gateway`. Without weighted routing, deleting old `Ingress` objects may be required to flip traffic.

See the Pelotech [LRSQL Chart](https://github.com/pelotech/charts/tree/main/charts/lrsql) for an example.

Once you have created your `ListenerSets` and `HTTPRoutes`, in AWS, in the EC2 page, ensure your load balancer has a `Listener` on the correct port (probably `443`) with at least one `Healthy` `Target Group` (it is OK to have unhealthy `Target Groups` as long as one is healthy).

In Argo, ensure your new `ListenerSets` and `HTTPRoutes` are healthy.

You can check your new routes (without flipping weight) by editing your hosts file. See [EG Migration Tester](https://github.com/apkatsikas/eg-migration-tester#local-testing-via-etchosts) docs for more info.

### HTTPRoute and ListenerSet annotations

#### Cert Manager Annotations

Use the following annotations on `ListenerSets` when using Cert Manager with Let's Encrypt:

* `acme.cert-manager.io/http01-parentreffallback: "true"`
* `cert-manager.io/cluster-issuer: letsencrypt`

#### External DNS Annotations

Use the following annotations on `HTTPRoutes` when using AWS Route53 and Weighted Routing:

* `external-dns.alpha.kubernetes.io/aws-weight: "0"`
* `external-dns.alpha.kubernetes.io/set-identifier: unique-name` (be sure to use a real unique name and not `unique-name`)

You can prepare a [cutover from Ingress -> Gateway](https://www.pelotech.com/post/ingress-nginx-migration) by annotating `Ingress` objects with `100` weight and the new `HTTPRoutes` with `0` weight, and then flip weights once ready.

### Cert Manager Gateway Issuer

An important late migration step is to ensure Cert Manager uses Gateway to issue Let's Encrypt certs. The `gateway` values are not wired up as replacements in the component, so you need to patch the `create-issuer` ArgoCD Application directly.

Create `_base/overlays/create-issuer-patch.yaml`:

``` yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: create-issuer
spec:
  source:
    helm:
      valuesObject:
        gateway:
          enabled: true
          name: eg
          namespace: envoy-gateway-system
```

Then add the patch to the `patches` array in `kustomization.yaml`:

``` yaml
  - target:
      group: argoproj.io
      version: v1alpha1
      kind: Application
      name: create-issuer
    path: _base/overlays/create-issuer-patch.yaml
```

See the [create-issuer values](https://github.com/pelotech/foundation/blob/688e1b6c97113b6183f93f6a21208f594daa5519/gitops/components/cert-manager/create-issuer/values.yaml#L6-L8) for all available gateway options.

Also be sure your Gateway has a [Listener for the challenge/solver on port 80](#gateway-certificate-challenge-acme-solver).

### Final Steps

Once all `Ingress` are cutover, you will need to ensure those are deleted, and the Ingress Controller is uninstalled from the cluster.
