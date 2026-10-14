# harbor-s3

AWS flavor of the [`harbor`](../../harbor/README.md) component. Includes the base, so list this one and not both.

* Registry images and charts on an S3 bucket, reached through IRSA on the `harbor-registry` ServiceAccount.
* Postgres WAL archiving and nightly base backups on S3 through the Barman Cloud plugin, reached through IRSA on
  the CNPG cluster ServiceAccount. Retention 30 days.

## Required kustomize-environment vars
* `AWS_REGION`: region of the bucket. Also sets the S3 endpoint, `https://s3.<AWS_REGION>.amazonaws.com`.
* `HARBOR_S3_BUCKET`: bucket for registry data, e.g. `my-org-harbor-prod`.
* `HARBOR_S3_ROLE_ARN`: IAM role with read and write on that bucket, trusted by `harbor:harbor-registry`.
* `HARBOR_BACKUP_S3_PATH`: Barman destination, e.g. `s3://my-org-backups/harbor/`.
* `HARBOR_BACKUP_ROLE_ARN`: IAM role with read and write on that path, trusted by `harbor:harbor-postgres`.

## Notes
* The registry runs an `aws-creds-refresh` sidecar. Harbor's `registry-photon` bundles aws-sdk-go v1 without the
  WebIdentity and Pod Identity credential providers ([goharbor/harbor#12888](https://github.com/goharbor/harbor/issues/12888)),
  so the IRSA token in the pod is never read. The sidecar runs a current aws-cli every 30 minutes and writes the
  session as a credentials file that the old SDK does read. Remove it once Harbor ships a registry built on
  distribution v3.
* `regionendpoint` is always set: the bundled driver rejects regions missing from its static list, such as
  `us-gov-east-1`, and an explicit endpoint skips that check.
