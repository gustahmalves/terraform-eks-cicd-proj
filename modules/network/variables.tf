variable "project-name" {
  default = "eks-cluster-project"

}


variable "tags" {
  default = {
    "ManagedBy" = "Terraform"
    "Name"      = "eks-cluster-proj"
  }

}