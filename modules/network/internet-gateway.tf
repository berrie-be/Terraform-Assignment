resource "aws_internet_gateway" "igw" { 
    vpc_id = aws_vpc.main_vpc.id 
    
    tags = merge(var.common_tags,{
      Name = "${var.project_name}-ig"
    })

    depends_on = [ aws_vpc.main ]
    }