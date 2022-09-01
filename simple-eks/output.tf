output "cluster_id" {
  description = "EKS cluster ID"
  value       = module.eks.cluster_id
}

output "cluter_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  value       = module.eks.cluster_security_group_id
  description = "Security group ids attached to the cluster control plane"
}

output "cluster_name" {
  value       = local.cluster_name
  description = "Kubernetes Cluster Name"
}
