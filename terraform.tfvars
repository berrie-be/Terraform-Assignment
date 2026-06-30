
# ----------------------------
# NETWORK CONFIG
# ----------------------------
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"
availability_zone   = "ap-south-1a"
project_name        = "terraform-project"

# ----------------------------
# EC2 INSTANCES
# ----------------------------
ec2_instances = {
  public = {
    vm_name        = "app-ec2"
    instance_type  = "t2.micro"
    subnet_key     = "public"
    key_path       = "/Users/kaberiagarwala/.ssh/my-ec2-key"
    is_public      = true

    ingress_rules = [
      {
        port        = 22
        description = "SSH from my IP"
        cidr_blocks = ["49.207.193.98/32"]   # 🔥 Replace with your actual IP
      }
    ]

    egress_rules = [
      {
        port        = 0
        description = "Allow all outbound"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }

  private = {
    vm_name        = "db-ec2"
    instance_type  = "t2.micro"
    subnet_key     = "private"
    key_path       = "/Users/kaberiagarwala/.ssh/my-ec2-key"
    is_public      = false

    ingress_rules = [
      {
        port        = 22
        description = "SSH from VPC only"
        cidr_blocks = ["10.0.0.0/16"]
      }
    ]

    egress_rules = [
      {
        port        = 0
        description = "Allow all outbound"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
}

