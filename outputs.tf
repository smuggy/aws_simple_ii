output "instance-ids" {
	value = aws_instance.simple-instance-ii.*.id
}

output "private-ips" {
	value = aws_instance.simple-instance-ii.*.private_ip
}