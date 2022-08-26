resource "aws_instance" "ec2" {
  ami           = data.aws_ami.ubuntu_amis.id
  instance_type = "t2.micro"
  tags = {
    Name = var.vpc_vars.ec2_name
  }
  #   vpc_security_group_ids = [ "${aws_security_group.sg.id}" ]
  security_groups = ["${aws_security_group.sg.id}"]
  key_name        = aws_key_pair.kp.key_name
  subnet_id       = aws_subnet.subnet.id
}

data "aws_ami" "ubuntu_amis" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  owners = ["099720109477"] # Canonical
}
