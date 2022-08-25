provider "aws" {
  region = var.region
}

resource "aws_instance" "jump_server" {
  ami           = data.aws_ami.ubuntu_amis.id
  instance_type = "t2.micro"
  tags = {
    Name = var.ec2_name
  }
  security_groups = [ "${aws_security_group.sg.id}" ]
  keykey_name = aws_key_pair.kp.key_name
}

data "aws_ami" "ubuntu_amis" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  #   filter {
  #     name   = "virtualization-type"
  #     values = ["hvm"]
  #   }

  owners = ["099720109477"] # Canonical
}

resource "aws_eip" "ip" {
    instance = aws_instance.jump_server.id
}