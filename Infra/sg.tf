module "securitygrouplinux" {
  source      = "../Modules/Security Group/"
  vpc_id      = "vpc-f2eddd95"
  appname              = "Linux"
  
}

resource "aws_security_group_rule" "allow_ingress" {
  type            = "ingress"
  from_port       = 22
  to_port         = 22
  protocol        = "-1"
  cidr_blocks     =["0.0.0.0/0"]
  security_group_id = "${module.securitygrouplinux.sg_id}"
}

resource "aws_security_group_rule" "allow_http" {
  type            = "ingress"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  cidr_blocks     =["0.0.0.0/0"]
  security_group_id = "${module.securitygrouplinux.sg_id}"
}


resource "aws_security_group_rule" "allow_egress" {
  type            = "egress"
  from_port       = 0
  to_port         = 65535
  protocol        = "-1"
  cidr_blocks     =["0.0.0.0/0"]
  security_group_id = "${module.securitygrouplinux.sg_id}"
}


module "securitygroupwindows" {
  source      = "../Modules/Security Group/"
  vpc_id      = "vpc-f2eddd95"
  appname     = "Windows"
}


resource "aws_security_group_rule" "allow_ingressw" {
  type            = "ingress"
  from_port       = 3389
  to_port         = 3389
  protocol        = "-1"
  cidr_blocks     =["0.0.0.0/0"]
  security_group_id = "${module.securitygroupwindows.sg_id}"
}

resource "aws_security_group_rule" "allow_httpw" {
  type            = "ingress"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  cidr_blocks     =["0.0.0.0/0"]
  security_group_id = "${module.securitygroupwindows.sg_id}"
}


resource "aws_security_group_rule" "allow_egressw" {
  type            = "egress"
  from_port       = 0
  to_port         = 65535
  protocol        = "-1"
  cidr_blocks     =["0.0.0.0/0"]
  security_group_id = "${module.securitygroupwindows.sg_id}"
}