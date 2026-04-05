resource "aws_eks_cluster" "eks_cluster" {
  name = "eks_cluster"

  role_arn = aws_iam_role.cluster_role.arn

  vpc_config {
    subnet_ids = [
      var.subnet_1a,
      var.subnet_1b,
      var.subnet_1c,
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.cluster_role_attachment
  ]
}
