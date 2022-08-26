terraform {
  backend "http" {

  }

  required_providers {
    aws = {
        source = "hashicorp/aws"
        versversion = "~> 4.15.0"
    }
  }
#   required_version = "~> 1.2.0"
}