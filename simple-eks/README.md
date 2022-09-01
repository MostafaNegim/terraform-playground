# Provision an EKS Cluster
How to provision an EKS cluster
[Hashicorp](https://github.com/hashicorp/learn-terraform-provision-eks-cluster)

## Verify the Cluster
Retrieve the access credentials for the cluster and configure `kubectl`.
```bash
aws eks --region $(terraform output -raw region) update-kubeconfig \
    --name $(terraform output -raw cluster_name)
```

### Information about the cluster

```bash
kubectl cluster-info
```