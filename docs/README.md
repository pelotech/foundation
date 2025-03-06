![pre-commit](https://github.com/pelotech/foundation/actions/workflows/pre-commit.yaml/badge.svg)
![Publish-Kustomizations](https://github.com/pelotech/foundation/actions/workflows/publish-kustomizations.yaml/badge.svg)


# Foundation - Pelotech's GitOps K8s Cluster
Foundation is our repository of base, reusable manifests for setting up GitOps k8s clusters, currently targeted for AWS EKS. ArgoCD is installed as the GitOps agent in a self-managed fashion and also includes Pelotech's set of opinionated components to solve everything that K8s doesn't out of the box (DNS/TLS, storage, logs/metrics etc.)

#### [Getting Started](./GETTING-STARTED.md)
#### [Architeture](./ARCHITECTURE.md)
#### [Tools](./TOOLS.md)


## bootstrap application

```yaml
---
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: argocd
  namespace: argocd
spec:
  project: infrastructure
  source:
    repoURL: 'git@github.com:pelotech/infrastructure' #changeme
    path: workloads-account/com/gitops #changeme
    targetRevision: main
  destination:
    namespace: argocd
    name: in-cluster
  syncPolicy:
    automated: {}
---
---
apiVersion: argoproj.io/v1alpha1
kind: AppProject
metadata:
  name: infrastructure
  namespace: argocd
  finalizers:
    - resources-finalizer.argocd.argoproj.io
spec:
  sourceRepos:
    - https://github.com/pelotech/foundation
    - https://github.com/pelotech/infrastructure #changeme
  destinations:
    - namespace: tailscale # tailscale
      server: https://kubernetes.default.svc
    - namespace: kube-system # nidhogg, multus
      server: https://kubernetes.default.svc
  sourceNamespaces:
    - argocd
  clusterResourceWhitelist:
    - group: '*'
      kind: '*'
```
