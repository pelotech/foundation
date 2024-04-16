# Getting started
Foundation is intended to serve as a reusable base of manifests to get your cluster up and running with minimal initial setup. The following directory structure should be all that's needed to get started:
```
./
 | environment.yaml
 | resources.yaml
 | kustomization.yaml
```

1. In `environment.yaml`, define a `ConfigMap` named `kustomize-environment`and set the following required variables for Foundation's manifests (powered by [Kustomize replacements](https://kubectl.docs.kubernetes.io/references/kustomize/kustomization/replacements/)):
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: kustomize-environment
  namespace: argocd
data:
  CLUSTER_NAME: "# name of your EKS cluster"
  AWS_REGION: "# AWS region of your EKS cluster"
  ARGOCD_SERVER_HOST: "# hostname for the cluster's ArgoCD web interace, e.g. argocd.example-cluster.com"
  ACME_ISSUER_EMAIL: "# email used by cert-manager for ACME/letsencrypt requests"
  VPC_CIDR_BLOCK: "# the CIDR block of your cluster's VPC i.e. '172.16.0.0/16'"

  # See the ./terraform/cluster_roles example module for setting up these roles and their policies
  ALB_ROLE_ARN: "arn:aws:iam::{YOUR_AWS_ACCOUNT_ID}:role/alb-role"
  CERT_MANAGER_ROLE_ARN: "arn:aws:iam::{YOUR_AWS_ACCOUNT_ID}:role/cert-manager-role"
  EBS_CSI_ROLE_ARN: "arn:aws:iam::{YOUR_AWS_ACCOUNT_ID}:role/ebs-csi-driver"
  EXTERNAL_DNS_ROLE_ARN: "arn:aws:iam::{YOUR_AWS_ACCOUNT_ID}:role/external-dns-role"
  KARPENTER_ROLE_ARN: "arn:aws:iam::{YOUR_AWS_ACCOUNT_ID}:role/karpenter-role"
  S3_CSI_ROLE_ARN: "arn:aws:iam::{YOUR_AWS_ACCOUNT_ID}:role/s3-csi-driver-role"

  # Only required if using Loki
  LOKI_GATEWAY_HOST: "# hostname for Loki gateway i.e. for Grafana to Loki"
  LOKI_ROLE_ARN: "arn:aws:iam::{YOUR_AWS_ACCOUNT_ID}:role/loki-role"
  LOKI_S3_BUCKET: "# name of S3 bucket where Loki will store logs"

  # Only required if using Fluent Bit
  FLUENT_BIT_ROLE_ARN: "arn:aws:iam::{YOUR_AWS_ACCOUNT_ID}:role/loki-role"

  # Only required if using ADOT
  ADOT_ROLE_ARN: "arn:aws:iam::{YOUR_AWS_ACCOUNT_ID}:role/adot-collector-role"
  AMP_RW_ENDPOINT: "# Prometheus remote endpoint for ADOT (if exporting to Prometheus/Grafana)"

```

2. Define a `resources.yaml`with the following:
```yaml
# This is ArgoCD's entrypoint for managing itself and the cluster - it will pick up the kustomization.yaml in this directory.
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: argocd
  namespace: argocd
spec:
  project: admins
  source:
    repoURL: {YOUR_REPO_URL}
    path: {PATH_TO_THIS_DIRECTORY}
    targetRevision: main
  destination:
    namespace: argocd
    name: in-cluster
  syncPolicy:
    automated: {}
```

3. Tie it all together with `kustomization.yaml`:
```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

resources:
  # Note: you can pick which version of Foundation's manifests to pull in
  - https://github.com/pelotech/foundation//gitops/base-install?ref=v0.0.85
  - ./environment.yaml
  - ./resources.yaml

components:
  # This is required for setting variables from environment.yaml
  - https://github.com/pelotech/foundation//gitops/base-install/replacements?ref=v0.0.85
  # Add any optional components from foundation below
  - https://github.com/pelotech/foundation//gitops/components/karpenter?ref=v0.0.85

commonLabels:
  app.kubernetes.io/managed-by: foundation-gitops
```

With these 3 files defined, now all you need to do is bootstrap the cluster. Run the following in this directory:
```bash
# Install and wait for CRDs first
$ kustomize build . | kfilt -i kind=CustomResourceDefinition > crds.yaml && kubectl apply -f crds.yaml
$ kubectl wait --for condition=established --timeout=30s -f crds.yaml
# Install the cluster
$ kustomize build . -o install.yaml && kubectl apply -f install.yaml
```
These commands only need to be run as a one-off either from your machine or even better from a CI/CD pipeline. From there, ArgoCD will take over managing the manifests via GitOps.
