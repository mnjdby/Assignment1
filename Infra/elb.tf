module "appelb" {
  source       = "../Modules/ELB/"
  #subnet       = ["${subnet-08b7536e}, ${subnet-fcecf9b5}"]
  subnet        = ["subnet-08b7536e", "subnet-fcecf9b5"]
  vpc_id       = "vpc-f2eddd95"
  appname      = "LBWL"
  lbtype       = "EALB"
  type         = "application" 
  internal     = "false"
  port        = "80"
  protocol    = "HTTP"
  security_group_ids = ["${module.securitygrouplinux.sg_id}"]
  elbinstance1 = "${module.Linuxserver.instance_ids}" 
  elbinstance2 = "${module.Windowsserver.instance_ids}"
  lbtag        = "EALB"
}