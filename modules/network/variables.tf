variable "vpc_cidr"{
    type = string
    default = ""
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
    default = ""
}

variable "public_subnet_cidr"{
    type = string
    default = "value"
}

variable "availability_zone"{
    type = string
    default = "value"
}

variable "private_subnet_cidr"{
    type = string
    default = "value"
}
