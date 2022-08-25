variable "region" {
  default = "us-east-1"
}

variable "ec2_name" {
  type        = string
  description = "EC2 name"
  default = "ansible_host"
}

variable "aws_properties" {
  type = map
  default = {
    public_ip = true
    key_name = "myseckey"
    secgroupname = "IAC-Sec-Group"
  }
}

# variable "remote_state_address" {
#   type        = string
#   description = "Gitlab remote state file address"
# }

# variable "username" {
#   type        = string
#   description = "Gitlab username to query remote state"
# }

# variable "access_token" {
#   type        = string
#   description = "GitLab access token to query remote state"
# }
