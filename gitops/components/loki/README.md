# Loki
Loki is a logging aggregator from Grafana labs. It has native support in Grafana as a data source.

This configuration deploys Loki in `singleBinary` mode (monolithic style), using S3 for log storage.

## Required Variables
* `LOKI_GATEWAY_HOST`: The hostname of the loki gateway ingress
* `LOKI_ROLE_ARN`: The role ARN to attach to the loki service account
* `LOKI_S3_BUCKET`: The name of the loki log storage bucket

## Required Secrets
A secret named `loki-basic-auth` in the `loki` namespace, which contains the basic auth credentials for the Loki gateway. See [this tutorial](https://kubernetes.github.io/ingress-nginx/examples/auth/basic/) for an example on how to generate such a secret.

## Required AWS Resources
* An S3 bucket for log storage
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
