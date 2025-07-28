module "network" {
  source = "./modules/network"

  VPC_CIDR = "172.16.0.0/16"

  EIP_COUNT       = 3
  AZS             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  PUBLIC_SUBNETS  = ["172.16.1.0/24", "172.16.2.0/24", "172.16.3.0/24"]
  PRIVATE_SUBNETS = ["172.16.4.0/24", "172.16.5.0/24", "172.16.6.0/24"]
  DB_SUBNETS      = ["172.16.8.0/24", "172.16.9.0/24", "172.16.10.0/24"]

}
