# Multus

A CNI meta-plugin for multi-homed pods in Kubernetes

## Overview

```mermaid
sequenceDiagram
    autonumber
    Note over Pod: Affinity & toleration for custom networking
    Pod->>Control Plane: "Hey there, I'm a pod that needs multi-home networking"
    loop Karpenter (Deployment)
        Control Plane->>Control Plane: Any pending/unschedulable pods? Determine best node pool to meet pod demand.
    end
    Karpenter-->>Multus Node: Provision node(s) from matching `NodePool` (with taints)
    Multus Node-->>Control Plane: Reporting for duty!
    Control Plane-->>Multus Node: Deploy Multus DaemonSet
    loop Nidhogg (Deployment)
        Control Plane->>Control Plane: DaemonSet ready? Request removal of taint from newly-provisioned Node
    end
    Control Plane-->>Multus Node: Remove Multus taint
    Pod->>Multus Node: Deploying to untainted node
```

## Resources

- [k8snetworkplumbingwg/multus-cni](https://github.com/k8snetworkplumbingwg/multus-cni)
- [includes `uswitch/nidhogg` to manage node taints](https://github.com/uswitch/nidhogg)
