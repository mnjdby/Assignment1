variable "security_group_ids" {
  default = []
}

variable "vpc_id" {
  default     = ""
  description = "The VPC subnet the instance(s) will go in"
}

variable "subnet_type" {
  default     = "private"
  description = "Subnet type. Either private or public."
}

variable "availability_zones" {
  default     = ["ap-southeast-1a", "ap-souteast-1b"]
  description = "The availability zones the we should create subnets in, launch instances in, and configure for ELB and ASG"
}

variable "number_of_targets" {
  default = ""
}

variable "subnet" {
  default = ["", ""]
}

variable "appname" {
  default = ""
}

variable "lbtype" {
  default = ""
}

variable "port" {
  default = ""
}

variable "protocol" {
  default = ""
}

variable "elbinstance1" {
 default = ""
}

variable "elbinstance2" {
 default = ""
}


variable "lbtag" {
 default = ""
}


variable "logs_enabled" {
  default = true
}

variable "type" {
  default = "application"
}

variable "expiration_date" {
  default = "20/06/18"
  type    = "string"
}

variable "idle_timeout" {
  default = 60
}

variable "internal" {
  default = false
}

variable "enable_deletion_protection" {
  default = false
}
