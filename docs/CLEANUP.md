# Cleanup

This is the location to be able to hunt down most of the various resources which are created by the clusters components

## Karpenter
* Search for tags with `karpenter.sh/managed-by` = `{cluster-name}`

## ALB/Cluster -
### Security groups
* Tags `elbv2.k8s.aws/cluster` = `{cluster-name}`
* Tags `aws:eks:cluster-name` = `{cluster-name}`
### Load Balancers
* Tags `elbv2.k8s.aws/cluster` = `{cluster-name}`
### Target Groups
* Tags `elbv2.k8s.aws/cluster` = `{cluster-name}`

## EBS
### Volumes
* Tags `ebs.csi.aws.com/cluster` = `true`
* Tags `kubernetes.io/cluster/{cluster-name}` = `owned`
* Tags `KubernetesCluster` = `{cluster-name}`
