variable "vpc_cidr"{
    type = string
}

variable "common_tags" {
    description = "Common tags applied to all resources"
    type        = map(string)
    default = {
        Project     = "Project Name"
        ManagedBy   = "Terraform"
        Owner       = "My Name"
    }
}

variable "project_name"{
    type = string
}

variable "public_subnet_cidr"{
    type = string
}

variable "availability_zone"{
    type = string
}

variable "private_subnet_cidr"{
    type = string
}

variable "ec2_instances" {
  type = map(object({
    instance_type = string
    subnet_key = string
    vm_name = string
    ingress_rules = list(object({ 
        port = number 
        description = string 
        cidr_blocks = list(string) })) 
    egress_rules = list(object({ 
        port = number 
        description = string 
        cidr_blocks = list(string) })) 
    key_path = string
    is_public = bool
  }))
}
