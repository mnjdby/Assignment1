resource "aws_security_group" "sg" {

  vpc_id = "${var.vpc_id}"
  name   = "${var.appname} SG"

  tags = {
    Name             = "SG for ${var.appname}"
  }
}

output "sg_id" {
  value = "${aws_security_group.sg.id}"
}

output "sg_name" {
   value = "${aws_security_group.sg.name}"
}


variable "vpc_id" {
  default = ""
}

variable "appname" {
  default = ""
}
