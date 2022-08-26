variable "region" {
  default = "us-east-1"
}

variable "vpc_vars" {
  type = map
  default = {
    key_name = "myseckey"
    ec2_name = "ec2"
  }
}