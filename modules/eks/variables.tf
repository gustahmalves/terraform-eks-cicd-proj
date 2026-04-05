variable "project-name" {
  default = "eks-cluster-project"

}


variable "tags" {
  default = {
    "ManagedBy" = "Terraform"
    "Name"      = "eks-proj"
  }

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