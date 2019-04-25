variable "instance_type" {
  default  = "t2.micro"
}



variable "rootdevicel" {
  type        = "map"
  description = "rootdevice properties"

  default = {
    volume_type  = "gp2"
    volume_size  = 10
    delete_on_termination = "true"
  }
}

variable "rootdevicew" {
  type        = "map"
  description = "rootdevice properties"

  default = {
    volume_type  = "gp2"
    volume_size  = 30
    delete_on_termination = "true"
  }
}

