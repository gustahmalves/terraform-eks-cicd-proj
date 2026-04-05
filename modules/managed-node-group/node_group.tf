resource "aws_eks_node_group" "mng_eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "NODE GROUP 1"
  node_role_arn   = aws_iam_role.mng_node_group_role.arn
  subnet_ids      = module.network.aws_subnet.vpc_subnet.id

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.node_group_AmazonEKSWorkerNodePolicy-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.node_group_AmazonEKS_CNI_Policy-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.node_group_AmazonEC2ContainerRegistryReadOnly-AmazonEC2ContainerRegistryReadOnly,
  ]

  tags = merge(
    var.tags,
    {
      "Name" = "eks-node-group"
    }
  )
}