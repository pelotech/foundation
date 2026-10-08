# cluster-autoscaler

The [Kubernetes cluster-autoscaler](https://github.com/kubernetes/autoscaler) chart, for clusters whose nodes
come from autoscaling groups the cloud manages. It grows a group when a pod cannot be scheduled and shrinks it
when nodes stay underused, within the bounds of each group.

Use one cloud flavor instead of this component, never both: the flavor includes it and sets the provider, the
credentials and where the controller runs.

* [`azure/cluster-autoscaler`](../azure/cluster-autoscaler/README.md): virtual machine scale sets, discovered
  by tag.
