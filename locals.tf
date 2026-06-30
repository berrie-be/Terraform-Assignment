locals {
  subnet_map = {
    public  = module.network.public_subnet_id
    private = module.network.private_subnet_id
  }
}