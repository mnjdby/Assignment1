data "aws_ami" "base_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["${lookup(var.ami_pattern, var.ami)}"]
  }

  owners = ["137112412989", "309956199498", "410034047840", "099720109477"]
}


// EC2 Instance Resource for Module

resource "aws_instance" "ec2_instance" {
  ami           = "${data.aws_ami.base_ami.id}"
  subnet_id     =  "${var.subnet_id}"
  instance_type = "${var.instance_type}"
  vpc_security_group_ids = ["${var.security_group_ids}"]
  key_name               = "${var.key_name}"
  ebs_optimized          = "${var.ebs_optimized}"
  user_data              = "${var.user_data}"
  root_block_device = {
    volume_type           = "${lookup(var.root_block_device, "volume_type")}"
    volume_size           = "${lookup(var.root_block_device, "volume_size")}"
    delete_on_termination = "${lookup(var.root_block_device, "delete_on_termination")}"
  }

  tags {
    Name               = "${var.appname} Instance"
}

  #count = "${var.number_of_instances}"

}

resource "aws_ebs_volume" "example" {
  availability_zone = "${var.availability_zone}"
  size              = 1
  count = 2
  tags = {
    Name = "Additional volume"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdm"
  #volume_id   = "${aws_ebs_volume.example.id}"
  volume_id    = "${element(aws_ebs_volume.example.*.id, count.index)}"
  instance_id = "${aws_instance.ec2_instance.id}"
}

resource "aws_eip" "eip" {
  instance = "${element(aws_instance.ec2_instance.*.id, count.index)}"
  vpc      = true
  count    = "${var.subnet_type == "public" ? var.number_of_instances : 0}"

  tags {
     Name               = "EIP for server"

  }
}
