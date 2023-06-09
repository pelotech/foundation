# Fluent Bit
Collects and exports logs to/from various sources and destinations. See the [official documentation](https://docs.fluentbit.io/manual/) for details.

## Required AWS Resources
Make sure the fluent-bit service account is using IRSA and has the following policy attached:
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogStream",
        "logs:CreateLogGroup",
        "logs:PutLogEvents"
      ],
      "Resource": "*"
    }
  ]
}
```

## Example Helm configuration: Output K8s logs to Cloudwatch for a single namespace
```yaml
config:
    inputs: |
      [INPUT]
          Name tail
          Path /var/log/containers/*.log
          Multiline.Parser docker, cri
          Tag kube.<namespace_name>.<pod_name>.<container_name>
          Tag_Regex (?<pod_name>[a-z0-9]([-a-z0-9]*[a-z0-9])?(\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*)_(?<namespace_name>[^_]+)_(?<container_name>.+)-
          Mem_Buf_Limit 5MB
          Skip_Long_Lines On
    customParsers: |
      [PARSER]
          Name docker_no_time
          Format json
          Time_Keep Off
          Time_Key time
          Time_Format %Y-%m-%dT%H:%M:%S.%L
      [PARSER]
          Name kube_tag
          Format regex
          Regex (?<namespace_name>[^.]+).(?<pod_name>[^.]+).(?<container_name>.+)
    filters: |
      [FILTER]
          Name kubernetes
          Match kube.*
          Kube_Tag_Prefix kube.
          Regex_Parser kube_tag
          Merge_Log On
          Keep_Log Off
          K8S-Logging.Parser On
          K8S-Logging.Exclude On
    outputs: |
      [OUTPUT]
          Name cloudwatch_logs
          Match kube.<YOUR_NAMESPACE>.*
          Region us-gov-west-1
          Auto_Create_Group true
          Log_Retention_Days 30
          Log_Key log
          Log_Group_Name /aws/eks/core-development/misc
          Log_Stream_Prefix pods
          Log_Group_Template /aws/eks/core-development/$kubernetes['namespace_name']
          Log_Stream_Template $kubernetes['pod_name']
```
