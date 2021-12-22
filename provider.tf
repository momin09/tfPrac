provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = var.aws_region
}

resource "aws_instance" "testingEC2" {
  ami = "ami-0e17ad9abf7e5c818"
  instance_type = "t2.micro"
}