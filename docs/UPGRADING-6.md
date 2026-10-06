# Upgrading a cluster to foundation 6

Foundation 6 makes the generic components cloud-neutral. A base component
carries no cloud settings, and a cluster lists one flavor per component:
`aws/<component>` or `azure/<component>`. On AWS the upgrade is a one-line
change per component in the cluster's `kustomization.yaml`.

## Checklist for an AWS cluster

| Listed today                        | List instead               | What moved to the flavor                                    |
|-------------------------------------|----------------------------|-------------------------------------------------------------|
| `components/traefik`                | `components/aws/traefik`   | The NLB Service annotations and `TRAEFIK_NLB_NAME`.         |
| `components/cert-manager`           | `components/aws/cert-manager` | The route53 dns01 solver and `AWS_REGION`.               |
| `components/external-dns`           | `components/aws/external-dns` | `provider: aws`.                                         |
| `components/kubevirt`               | `components/aws/kubevirt`  | `gp3-immediate`, CDI scratch on `gp3`, Karpenter placement. |
| `components/aws/*-irsa`             | no change                  | They include the AWS flavors.                               |
| `components/aws/ebs-csi`            | no change                  | It follows the shared `snapshot-controller` path itself.    |

Skipping the `traefik` line is the costly mistake: the Service loses its NLB
annotations, so the AWS Load Balancer Controller drops the NLB and the
cluster's ingress goes down.

The `kustomize-environment` keys do not change for AWS. `TRAEFIK_NLB_NAME`
and `AWS_REGION` stay required, now by the flavors.

## Overrides to check

* A patch on the `create-issuer` Application that sets `awsRegion` or
  `solvers.dns01.enabled` must set `solvers.dns01.route53.region` and
  `solvers.dns01.route53.enabled` instead (`create-issuer` 2.0.0).
* A patch on the `kubevirt` Application keeps working: the flavor only
  changes `spec.source.path`.

## CloudNativePG

Foundation 6 adds `components/cnpg`. It installs the CloudNativePG operator and
the Barman Cloud plugin from their Helm charts, as one Application named `cnpg`
in `cnpg-system`. It needs cert-manager for the plugin's certificates. The
component is optional: a cluster without CloudNativePG needs nothing here.

### Switching from a cluster-local install

A cluster that installs CNPG itself switches in one commit:

1. Delete the cluster's own `cnpg` Application and list `components/cnpg`.
   Both use the name `cnpg`, so ArgoCD updates the Application in place.
2. Remove the CNPG charts repository and the `cnpg-system` namespace from the
   cluster's own AppProject. The `utils` project allows them now.
3. Prune the old plugin objects once the new plugin runs. The chart renames the
   plugin Deployment, service account, RBAC and Issuer, and the Application
   does not prune on its own.

### Gotchas

* The component targets the cluster with `destination.server`. If your own
  Application used `destination.name` and its parent applies server-side, the
  switch can leave both fields set, and ArgoCD rejects the Application. Remove
  `name` from the live Application once.
* The component applies server-side. An install that synced with `Replace=true`
  rewrote the operator's webhook configurations without the CA bundle the
  operator injects. Webhook calls then failed with `x509: certificate signed by
  unknown authority` until the operator's hourly certificate maintenance put
  the CA back.
* Every Postgres cluster that archives through the plugin restarts its pods
  once, because the plugin version sets the sidecar image. CloudNativePG
  restarts the primary in place by default, so a single-instance cluster goes
  down briefly and its clients may fail their health checks. A cluster with
  replicas can set `primaryUpdateMethod: switchover` first.
* The renamed Issuer reissues the plugin certificates. Take a backup after the
  switch to confirm the operator still reaches the plugin.
* The plugin may jump several versions. Read its release notes from your
  current version.

### Verify the switch

* `ContinuousArchiving` reports `True` even when no archiver is configured.
  Check `pg_stat_archiver` and the WAL files in the object store instead.
* A change to an ObjectStore, such as its `destinationPath`, reaches the
  instance sidecars only after the instance pods restart.

## Verify before merging

Build the cluster on the new tag and diff it against the current tag:

```bash
kustomize build --enable-alpha-plugins --enable-exec . > new.yaml
```

Expected differences: the `create-issuer` values move from `awsRegion` to
`solvers.dns01.route53`, and the `kubevirt` Application path changes to
`gitops/components/aws/kubevirt/kustomize`. Everything else renders the same.
