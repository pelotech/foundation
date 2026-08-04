# AWS components

Components in this directory are **meaningful only on AWS/EKS**:

* Pure-AWS infrastructure: [`alb`](alb/README.md) (AWS Load Balancer
  Controller), `ebs-csi`, `s3-csi`, and `karpenter`.
* The `*-irsa` flavor components — IRSA is an AWS mechanism. Each includes its
  base component (which may live at the top level, e.g.
  `aws/cert-manager-irsa` includes `../../cert-manager`) and adds the IAM role
  annotations. Use a flavor **instead of** its base, never both.

## Generic components with AWS config (and the future multi-cloud shape)

Top-level components like `external-dns`, `cert-manager`, `traefik`,
and `envoy-gateway` are generic controllers that currently
carry their AWS configuration inline (route53 solvers, NLB service
annotations, `provider: aws`). This is deliberate: splitting them into
cloud-neutral bases before a second cloud consumer exists would create base
components that cannot run anywhere on their own, and would guess at seams
that only real requirements can define.

When a non-AWS (e.g. GKE) cluster becomes concrete, the intended shape is the
**flavor pattern proven by the `*-irsa` components**: the generic base loses
its inline cloud config, and per-cloud sibling flavors (`aws/external-dns`,
`gke/external-dns`, ...) include the base and layer the cloud specifics —
one-line consumption, duplicate-include errors instead of silent
misconfiguration, no ordering traps.
