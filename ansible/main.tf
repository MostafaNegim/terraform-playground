provider "aws" {
    region = variable.region
}
# resource "aws_instance" "jump_server" {

# }

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