# Loki
Loki is a logging aggregator from Grafana labs. It has native support in Grafana as a data source.

This configuration deploys Loki in replicated `singleBinary` (monolithich) mode - Loki can also be deployed with each of its write/read/backend components broken out into microservices, but singleBinary was chosen for simplicity.
The logs are stored in an S3 bucket that must be preconfigured (see below for example.)

This installation also uses Loki's [boltdb-shipper](https://grafana.com/docs/loki/latest/operations/storage/boltdb-shipper/) since at the time of writing [TSDB](https://grafana.com/docs/loki/latest/operations/storage/tsdb/) was still in development.

To make the logs available in Grafana, this installation sets up the Loki Gateway behind HTTP basic auth (the `loki-basic-auth` Secret). Use the `LOKI_GATEWAY_HOST` value when adding Loki as a datasource in Grafana.

Once Loki is up and running you can ship logs to it with fluent-bit, for an example see [this folder](../fluent-bit/README.md).

## NOTE
Kustomize [does not currently support](https://github.com/kubernetes-sigs/kustomize/issues/3787) overriding YAML file values (like `spec.source.helm.values`), which means the values in this manifest can't be easily changed. Until the linked issue above is resolved, it's recommended to override `spec.source.helm.values` with a copy-pasted version of what's in this manifest, and make your modifications from there.

## Required Variables
* `LOKI_GATEWAY_HOST`: The hostname of the loki gateway ingress
* `LOKI_ROLE_ARN`: The role ARN to attach to the loki service account
* `LOKI_S3_BUCKET`: The name of the loki log storage bucket

## Required Secrets
A secret named `loki-basic-auth` in the `loki` namespace, which contains the basic auth credentials for the Loki gateway. See [this tutorial](https://kubernetes.github.io/ingress-nginx/examples/auth/basic/) for an example on how to generate such a secret.

## Required AWS Resources
* An S3 bucket for log storage:
```json
module "loki_storage_s3" {
  source                                = "terraform-aws-modules/s3-bucket/aws"
  version                               = "3.8.2"
  bucket                                = "<<YOUR_LOKI_STORAGE_BUCKET_NAME>>"
  attach_deny_insecure_transport_policy = true
  attach_require_latest_tls_policy      = true
  block_public_acls                     = true
  block_public_policy                   = true
  ignore_public_acls                    = true
  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }
}

```
* IAM policy for the `loki` service account:
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:PutObject",
                "s3:GetObject",
                "s3:DeleteObject"
            ],
            "Resource": [
                "arn:aws:s3:::{LOKI_S3_BUCKET}",
                "arn:aws:s3:::{LOKI_S3_BUCKET}/*"
            ]
        }
    ]
}
```
* If using grafana, a data source for Loki:
```hcl
resource "grafana_data_source" "loki" {
  provider            = grafana.amg
  type                = "loki"
  name                = "loki"
  url                 = "{LOKI_GATEWAY_HOST}"
  basic_auth_enabled  = true
  basic_auth_username = "admin"

  secure_json_data_encoded = jsonencode({
    basicAuthPassword = var.LOKI_BASIC_AUTH_PASSWD
  })
}
```
