provider "aws" {
  region  = var.region
  profile = var.profile
}

data "aws_vpc" "vpc" {
  tags = {
    Name = var.vpc_name
  }
}

data "aws_subnet" "my-private0" {
  vpc_id = data.aws_vpc.vpc.id
  tags = {
    Name = var.subnet_private0
  }
}

data "aws_subnet" "my-private1" {
  vpc_id = data.aws_vpc.vpc.id
  tags = {
    Name = var.subnet_private1
  }  
}