
locals {
    node_count = 1
#    vpc_id       = data.aws_vpc.kube_vpc.id
#    subnet_id    = data.aws_subnet.kube_subnet.id
#    secgrp_id    = data.aws_security_group.vpc_secgrp.id
    key_name     = "test-kube"
    ami_id       = "ami-05c1fa8df71875112"
    secgrp_name  = "kube_vpc_default"
    region       = "us-east-2"

    availability_zone = "${local.region}a"
}


#resource "aws_instance" "simple-instance-ii" {
# 18.04 LTS Bionic amd 64 hvm:ebs-ssd
#    ami               = local.ami_id
#    instance_type     = "t3.nano"
#    availability_zone = local.availability_zone
#    count             = local.node_count

#    key_name          = local.key_name
#    subnet_id         = local.subnet_id
#    user_data         = "si-${format("%02d", count.index)}"
    
#    vpc_security_group_ids = [local.secgrp_id]

#    root_block_device {
#        volume_size = 10
#    }

#    tags = {
#        Name = "simple-instance-ii"
#    }

resource "random_string" "random" {
  length           = 16
  special          = true
  override_special = "/@£$"
}

#}

module "base" {
  source  = "app.terraform.io/podspace/base/tls//rsa_key_pair"
  version = "0.1.3"
}
