# Cluster Ingress controller

This directory defines a configuration to provide Ingress support on the
cluster. This configuration is specific to an AWS environment where TLS
termination is handled by Nginx on the cluster (as opposed to terminating TLS
via AWS ALB). In this scenario there are two "phases", first to allow traffic
into the cluster (to Nginx), and second how to configure Nginx for dispatch to
on-cluster services.

The first phase entails using the AWS Load Balancer Controller to provision a
Layer 4 load balancer (AWS NLB) for traffic into the cluster from outside.
The second phase entails the Nginx Ingress Controller dynamically configuring
the Layer 7 load balancer (Nginx) via Kubernetes `Ingress` objects.

## AWS Load Balancer Controller

Used to provision an AWS NLB (Layer 4) load balancer to receive traffic
externally and to terminate TLS with Nginx on the cluster (via the Nginx
Ingress Controller).

## Nginx Ingress Controller

Used to service Ingress objects created on the cluster. The combination of
`external-dns`, `cert-manager`, and `nginx-ingress` together provide DNS, TLS,
and HTTP(S) load balancing for Ingress objects.

### Sequence/interaction diagram

```mermaid
---
title: Pelotech Foundation AWS environment ingress-controller
---
sequenceDiagram
    Developer->>+K8S Apiserver: kubectl get pods -n default
    K8S Apiserver-->>-Developer: Pods list

    AWS LB Controller-->>+K8S Apiserver: Watch Service (LB)
    External DNS Controller-->>+K8S Apiserver: Watch Ingress & Service
    Cert Manager Controller-->>+K8S Apiserver: Watch Ingress & Certificate
    Nginx Ingress Controller->>+K8S Apiserver: Create Service (LB)
    K8S Apiserver-->>+AWS LB Controller: Service (LB) created
    AWS LB Controller->>+AWS ALB API: Create NLB
    AWS ALB API-->>-AWS LB Controller: NLB Created (DNS address)
    AWS LB Controller-->>-K8S Apiserver: Update Service (LB) DNS address

    Developer->>+K8S Apiserver: Create Ingress default/echo
    K8S Apiserver-->>-Developer: Ingress created
    K8S Apiserver-->>-Nginx Ingress Controller: Ingress created
    K8S Apiserver-->>-External DNS Controller: Ingress created (DNS address requested)
    External DNS Controller->>+AWS Route53: Create/Update DNS Record
    AWS Route53-->>+External DNS Controller: DNS Record Created/Updated
    K8S Apiserver-->>-Cert Manager Controller: Ingress created (TLS Cert requested)
    Cert Manager Controller->>+Let's Encrypt: Create/Update TLS Cert
    Let's Encrypt-->>+Cert Manager Controller: TLS Certificate
    Cert Manager Controller->>+K8S Apiserver: Create/Update Secret (TLS Cert)
    K8S Apiserver-->>-Nginx Ingress Controller: Secret created (TLS cert)
    Nginx Ingress Controller-->>+Nginx Ingress Controller: Update config
```
