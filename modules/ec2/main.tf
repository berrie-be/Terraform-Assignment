resource "aws_security_group" "ec2" {
  name        = "${var.vm_name}-sg"
  vpc_id      = var.vpc_id

  tags = {
    Name = "allow_tls"
  }

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port = ingress.value.port
      to_port = ingress.value.port
      protocol = "tcp"
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port = egress.value.port
      to_port = egress.value.port
      protocol = "tcp"
      cidr_blocks = egress.value.cidr_blocks
      description = egress.value.description
    }
  }
}


resource "aws_instance" "example" {
    ami = "ami-00571315c603ed1f7"
    instance_type = var.instance_type
    subnet_id     = var.subnet_id
    key_name      = aws_key_pair.deployer.key_name
    vpc_security_group_ids = aws_security_group.ec2.id

    tags = {
        Name = "${var.vm_name}-ec2"
    }

    depends_on = [ aws_key_pair.deployer, aws_security_group.ec2 ]
}

resource "aws_key_pair" "deployer" {
  key_name   = "${var.server_name}-key"
  public_key = "file(${var.key_path})"
}