# AWS components

Components in this directory are **meaningful only on AWS/EKS**:

* Pure-AWS infrastructure: [`alb`](alb/README.md) (AWS Load Balancer
  Controller), `ebs-csi`, `s3-csi`, and `karpenter`.
* The AWS flavors of the generic top-level controllers: `aws/cert-manager`
  (route53 dns01 solver, `AWS_REGION`), `aws/external-dns` (`provider: aws`)
  and `aws/traefik` (NLB annotations, `TRAEFIK_NLB_NAME`). Each includes its
  base (`../../cert-manager`, ...) and layers the AWS settings on it.
* [`kubevirt`](kubevirt): the AWS flavor of the top-level
  [`kubevirt`](../kubevirt) component: EBS storage for CDI and Karpenter node
  placement over the cloud-neutral base.
* The `*-irsa` flavor components — IRSA is an AWS mechanism. Each includes the
  AWS flavor above (e.g. `aws/cert-manager-irsa` includes `../cert-manager`)
  and adds the IAM role annotations.

Use one flavor **instead of** its base, never both: including two of them
fails with a duplicate-resource error.

## Generic components and the flavor shape

Top-level `external-dns`, `cert-manager` and `traefik` carry no cloud settings.
A base alone is not a working deployment on any cloud (external-dns would even
fall back to the chart's `aws` default), so a cluster always lists one flavor:
`aws/<component>` here or `azure/<component>` in [`../azure`](../azure/README.md).
`envoy-gateway` still carries its AWS configuration inline and follows the same
pattern when a second cloud needs it.
