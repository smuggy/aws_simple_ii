output instance-ids {
	value = aws_instance.simple-instance-ii.*.id
}

output private-ips {
	value = aws_instance.simple-instance-ii.*.private_ip
}

output secgrp-id {
	value = data.aws_security_group.vpc_secgrp.id
}

output az {
	value = local.availability_zone
}

output vpc-id {
	value = data.aws_vpc.kube_vpc.id
}

output subnet {
	value = data.aws_subnet.kube_subnet.id
}