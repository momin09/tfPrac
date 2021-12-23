resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.prac_VPC.id

    # Inner Rule
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.prac_igw.id
    }

    tags = {
        Name = "tfPrac-pubRT"
    }
}

resource "aws_route_table_association" "pubRT_Association_1" { 
    subnet_id = aws_subnet.prac_public_subnet.id
    route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.prac_VPC.id

    tags = {
        Name = "tfPrac-pirvRT"
    }
}

resource "aws_route_table_association" "privRT_Association_2" { 
    subnet_id = aws_subnet.prac_private_subnet.id
    route_table_id = aws_route_table.private_rt.id
}

# Outer Rule
# Outer Rule is more userful than Inner Rule(5~8L)
resource "aws_route" "private_nat" {
    route_table_id = aws_route_table.private_rt.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.prac_natG.id
}