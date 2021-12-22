provider "aws" {
    region = var.aws_region
}

resource "aws_instance" "testingEC2" {
  ami = "ami-0e17ad9abf7e5c818"
  instance_type = "t2.micro"
}