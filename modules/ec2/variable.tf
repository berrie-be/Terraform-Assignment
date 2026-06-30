variable "instance_type"{
    type = string
}

variable "subnet_id" {
    type = string
}

variable "key_path" {
    type = string
}   

variable "vpc_id" {
    type = string
}

variable "vm_name" {
    type = string
}   

variable "is_public" {
    type = bool
}

variable "ingress_rules" { 
    description = "List of ingress rules" 
    type = list(object({ 
        port = number 
        description = string 
        cidr_blocks = list(string) })) 
        } 
        
variable "egress_rules" { 
    description = "List of egress rules" 
    type = list(object({ 
        port = number 
        description = string 
        cidr_blocks = list(string) })) 
        }