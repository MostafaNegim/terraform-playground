resource "aws_security_group" "sg" {
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  lifecycle {
    create_before_destroy = true
  }
}