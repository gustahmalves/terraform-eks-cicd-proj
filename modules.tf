module "network" {
  source = "./modules/network"

}

module "eks-cluster" {
  source    = "./modules/eks"
  subnet_1a = module.network.subnet_1a
  subnet_1b = module.network.subnet_1b
  subnet_1c = module.network.subnet_1c

}

module "mng-node-group" {
    source = "./modules/managed-node-group"
  
}
