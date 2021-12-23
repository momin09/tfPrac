provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = var.aws_region
}

resource "aws_vpc" "prac_VPC" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "tfPrac-VPC"
  }
}

resource "aws_subnet" "prac_public_subnet" {
  vpc_id = aws_vpc.prac_VPC.id
  cidr_block = "10.0.1.0/24"

  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "tfPrac-subnet1"
  }
}

resource "aws_subnet" "prac_private_subnet" {
  vpc_id = aws_vpc.prac_VPC.id
  cidr_block = "10.0.2.0/24"

  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "tfPrac-subnet2"
  }
}

resource "aws_internet_gateway" "prac_igw" {
  vpc_id = aws_vpc.prac_VPC.id

  tags = {
    Name = "tfPrac-igw"
  }
}

resource "aws_eip" "prac_elasticIP" {
  vpc = true

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_nat_gateway" "prac_natG" {
  allocation_id = aws_eip.prac_elasticIP.id

  subnet_id = aws_subnet.prac_public_subnet.id

  tags = {
    Name = "tfPrac-natGateway"
  }
}