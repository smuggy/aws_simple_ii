
locals {
    node_count = 1
    vpc_id       = "vpc-07a3483589f1e7493"
    subnet_id    = "subnet-064d4db5dd3ea9db5"
    secgrp_id    = "sg-0feb0bdf0ee1fd034"
    key_name     = "test-kube"
    ami_id       = "ami-05c1fa8df71875112"
    secgrp_name  = "kube_vpc_default"
}


resource "aws_instance" "simple-instance-ii" {
# 18.04 LTS Bionic amd 64 hvm:ebs-ssd
    ami               = local.ami_id
    instance_type     = "t3.nano"
    availability_zone = "us-east-2a"
    count             = local.node_count

    key_name          = local.key_name
    subnet_id         = local.subnet_id
    user_data         = "si-${format("%02d", count.index)}"
    vpc_security_group_ids = [local.secgrp_id]

    root_block_device {
        volume_size = 10
    }

    tags = {
        Name = "simple-instance-ii"
    }
}
