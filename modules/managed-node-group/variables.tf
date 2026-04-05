variable "project-name" {
  default = "eks-cluster-project"

}

variable "eks_cluster_name" {
  description = "EKS CLUSTER NAME"

}

variable "subnet_1a" {
  description = "Subnet 1a"

}
variable "subnet_1b" {
  description = "Subnet 1b"

}
variable "subnet_1c" {
  description = "Subnet 1c"

}

variable "tags" {
  default = {
    "ManagedBy" = "Terraform"
    "Name"      = "eks-proj"
  }

}