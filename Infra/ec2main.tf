module "Linuxserver" {
   source               = "../Modules/EC2/"
   vpc_id               = "vpc-f2eddd95"
   subnet_id            = "subnet-08b7536e"
   subnet_type          = "public"
   number_of_instances  = 1
   appname              = "Linux"
   ami                  = "ubuntu"
   key_name             = "apache"
   root_block_device    = "${var.rootdevicel}"
   #user_data            =  "${var.userdata}"
   #user_data             =  "${file("/script/apacheconfig.sh")}"
   user_data               = "${file("${path.module}/apacheconfig.sh")}"
   availability_zone    = "ap-southeast-1a"
   instance_type        = "${var.instance_type}"
   security_group_ids   = ["${module.securitygrouplinux.sg_id}"]

   
}

module "Windowsserver" {
   source               = "../Modules/EC2/"
   vpc_id               = "vpc-f2eddd95"
   subnet_id            = "subnet-fcecf9b5"
   subnet_type          = "public"
   number_of_instances  = 1
   appname              = "Windows"
   ami                  = "windows"
   key_name             = "IIS"
   root_block_device    = "${var.rootdevicew}"
   #user_data               = "${file("${path.module}/IISConfig.ps1")}"
   availability_zone    = "ap-southeast-1b"
   instance_type        = "${var.instance_type}"
   security_group_ids   = ["${module.securitygroupwindows.sg_id}"]
}

