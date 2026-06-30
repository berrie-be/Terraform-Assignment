module "network"{
    source = "./modules/network"
    vpc_cidr = var.vpc_cidr
    common_tags = var.common_tags
    project_name = var.project_name
    public_subnet_cidr = var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr
    availability_zone = var.availability_zone
}

module "ec2"{
    source = "./modules/ec2"
    vpc_id = module.network.vpc_id

    for_each = var.ec2_instances

    instance_type = each.value.instance_type
    subnet_id = local.subnet_map[each.value.subnet_key]
    vm_name = each.value.vm_name
    ingress_rules = each.value.ingress_rules
    egress_rules  = each.value.egress_rules
    key_path = each.value.key_path
    is_public = each.value.is_public
    
}