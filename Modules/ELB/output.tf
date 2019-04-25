output "id" {
  value = "${aws_lb.lb.id}"
}

output "dns_name" {
  value = "${aws_lb.lb.dns_name}"
}

output "zone_id" {
  value = "${aws_lb.lb.zone_id}"
}

output "arn" {
  value = "${aws_lb.lb.arn}"
}
