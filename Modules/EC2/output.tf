output "instance_ids" {
  value = "${aws_instance.ec2_instance.id}"
}

output "private_ips" {
  value = ["${aws_instance.ec2_instance.*.private_ip}"]
}

output "public_ips" {
  value = ["${aws_eip.eip.*.public_ip}"]
}