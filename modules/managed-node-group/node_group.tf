resource "aws_eks_node_group" "mng_eks_node_group" {
  cluster_name    = var.eks_cluster_name
  node_group_name = "NODE GROUP 1"
  node_role_arn   = aws_iam_role.mng_node_group_role.arn
  subnet_ids      = [var.subnet_1a, var.subnet_1b, var.subnet_1c]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.node_group_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.node_group_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.node_group_AmazonEC2ContainerRegistryReadOnly,
  ]

  tags = merge(
    var.tags,
    {
      "Name" = "eks-node-group"
    }
  )
}