# ingress-nginx (EOL — migration window only)

The [retired](https://kubernetes.io/blog/2025/11/11/ingress-nginx-retirement/)
ingress-nginx controller, pinned at its terminal chart version (no further
releases or CVE patches). Kept as a separate component only for the migration
window — see the [`traefik`](../traefik/README.md) component for the maintained
drop-in replacement and the cutover procedure.

Requires the [`aws-alb`](../aws-alb/README.md) component (AWS Load Balancer
Controller) to provision its NLB, which is named after `CLUSTER_NAME`.

`controller.publishService.enabled` is exposed as a helm parameter (default
`"true"`). When the `traefik` component is enabled it overrides this via the
`NGINX_PUBLISH_SERVICE` key to coordinate which controller owns Ingress status
(and therefore external-dns records) — see the
[traefik README](../traefik/README.md) for the switch semantics.
