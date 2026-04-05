output "cluster_id" {
  value = aws_eks_cluster.eks_cluster.id

}

output "eks_vpc_config" {
  value = aws_eks_cluster.eks_cluster.vpc_config

}

output "oidc" {
  value = aws_eks_cluster.eks_cluster.identity
}