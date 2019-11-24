data "aws_security_group" "vpc_secgrp" {
  name = local.secgrp_name
}

data "aws_vpc" "kube_vpc" {
  tags = {
    Name = "kube-us-east-2-vpc"
  }
}