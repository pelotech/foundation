# Architecture

## Overview

In principle we seperate out items into 3 types of components
1. Cloud/On-Prem provider - This is all Terraform on equiv to setup the base infrastructure primitives to provide and k8s cluster - The terraform folder in the repo has an example
2. Kustomize (Cluster bootstrap) - Kustomize install of Argocd for declaritive setup
3. Environment add-ons - All the extras the Organization needs

A Foundation cluster comes with the following base components installed:
* [ArgoCD](https://argo-cd.readthedocs.io/en/stable/): GitOps agent (installed with [declarative setup](https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/))
* [external-dns](https://github.com/kubernetes-sigs/external-dns): Automatic DNS record management
* [cert-manager](https://cert-manager.io/): Automatic TLS certificate management
* [EBS CSI Driver](https://github.com/kubernetes-sigs/aws-ebs-csi-driver): Support persistent storage using AWS EBS volumes
* [NGINX Ingress controller](https://kubernetes.github.io/ingress-nginx/): NGINX Ingress controller paired with AWS NLB
* [Reloader: automatically reload](https://github.com/stakater/Reloader): Automatically reload deployments when secrets/configmaps change

Additionally the following optional components can be installed:
* [Amazon Distribution for Open Telemetry (ADOT)](https://github.com/aws-observability/aws-otel-collector): Collect and export metrics with Open Telemetry
* [Fluent Bit](https://fluentbit.io/): Lightweight log collector and exporter for containerized solutions
* [Loki: Open source](https://grafana.com/oss/loki/): Log aggregator from Grafana Labs with S3 log persistence
* [Cluster Autoscaler:](https://github.com/kubernetes/autoscaler): Cluster node scaling
* [Goldilocks](https://goldilocks.docs.fairwinds.com/): Initial recommendations for setting resource requests and limits
* [Tailscale](https://tailscale.com): VPN access within the cluster
