resource "aws_eip" "main" {
  domain = "vpc"
  tags = merge(var.common_tags,{
    Name = "${var.project_name}-eip"
  })
  }

  resource "aws_nat_gateway" "main"{
    allocation_id = aws_eip.main.id
    subnet_id = aws_subnet.public.id

    tags = merge(var.common_tags,{
        Name = "${var.project_name}-nat"
    })

    depends_on = [ aws_internet_gateway.igw ]
  }