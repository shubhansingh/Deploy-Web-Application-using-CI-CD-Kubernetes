# Output EKS Cluster Endpoint
output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

# Output EKS Cluster ARN
output "eks_cluster_arn" {
  value = module.eks.cluster_arn
}
