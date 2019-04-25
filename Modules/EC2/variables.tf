variable "ami" {
  default = "linux"
}

variable "ami_pattern" {
  default = {
    "awsami"  = "Amazon Linux AMI*"
    "linux"   = "RHEL-7.5_HVM_GA-*"
    "windows" = "windowsami*"
    "ubuntu"  = "ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server*"
  }
}

variable "key_name" {
  default = ""
}

variable "ebs_optimized" {
  default = "false"
}

variable "security_group_ids" {
  default = ["ddas", "dasd"]
}

variable "subnet_id" {
  default = "subnet-12345"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "vpc_id" {
  default     = ""
  description = "The VPC subnet the instance(s) will go in"
}

variable "subnet_type" {
  default     = "public"
  description = "Subnet type. Either private or public."
}

variable "subnet_index" {
  description = "Subnet index - in case multiple subnets found and you want to use concrete one."
  default     = 1
}

variable "number_of_instances" {
  description = "number of instances to make"
  default     = 1
}

variable "iam_role" {
  default = "base"
}

variable "root_block_device" {
  default = {
    volume_type           = "gp2"
    volume_size           = 30
    delete_on_termination = true
  }
}


variable "appname" {
  default = ""
}


variable "user_data" {
  default = ""
  type    = "string"
}

variable "private_ip" {
  default = ""
}

variable "availability_zones" {
  default     = ["ap-southeast-1a", "ap-southeast-1b"]
  description = "The availability zones the we should create subnets in, launch instances in, and configure for ELB and ASG"
}

variable "availability_zone" {
  default     = ""
  description = "The availability zones the we should create subnets in, launch instances in, and configure for ELB and ASG"
}

