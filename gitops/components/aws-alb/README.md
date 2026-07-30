# AWS Load Balancer Controller

Deploys the [AWS Load Balancer Controller](https://kubernetes-sigs.github.io/aws-load-balancer-controller/),
which reconciles `Service` objects carrying `service.beta.kubernetes.io/aws-load-balancer-*`
annotations into AWS NLBs.

This is the **shared base** for every ingress data plane in this repo — the
`ingress-nginx`, `traefik`, and `envoy-gateway` components all create
LoadBalancer Services that this controller turns into NLBs. Enable it before
(or alongside) any of them.

## Required `kustomize-environment` keys

| Key | Purpose |
|---|---|
| `CLUSTER_NAME` | EKS cluster name for the controller |
| `ALB_ROLE_ARN` | IRSA role ARN for the controller's ServiceAccount |

Formerly bundled with ingress-nginx in the `aws-alb-nginx` component, which now
aggregates `aws-alb` + `ingress-nginx` for backwards compatibility.
