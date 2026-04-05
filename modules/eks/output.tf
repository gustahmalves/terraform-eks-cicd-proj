output "cluster_id" {
  value = aws_eks_cluster.eks_cluster.id

}

output "eks_vpc_config" {
  value = aws_eks_cluster.eks_cluster.vpc_config

}

output "eks_cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}


output "oidc" {
  value = aws_eks_cluster.eks_cluster.identity
}