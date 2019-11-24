data "aws_security_group" "vpc_secgrp" {
  name = local.secgrp_name
}