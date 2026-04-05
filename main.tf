terraform {
  required_version = ">= 0.12"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket = "terraform-eks-proj"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"

  }
}

provider "aws" {
  region = var.region
}

module "network" {
  source = "./modules/network"

}


module "eks-cluster" {
  source    = "./modules/eks"
  subnet_1a = module.network.subnet_1a
  subnet_1b = module.network.subnet_1b
  subnet_1c = module.network.subnet_1c

}

