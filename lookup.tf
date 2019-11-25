data "aws_security_group" "vpc_secgrp" {
  name = local.secgrp_name
}

data "aws_vpc" "kube_vpc" {
  tags = {
    Name = "kube-us-east-2-vpc"
  }
}

data "aws_subnet" "kube_subnet" {
  vpc_id = data.aws_vpc.kube_vpc.id
  availability_zone = local.availability_zone
}