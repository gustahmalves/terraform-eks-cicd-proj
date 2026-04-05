output "vpc_config" {
  value = module.eks-cluster.eks_vpc_config
}

output "oidc_identity" {
  value = module.eks-cluster.oidc_identity

}