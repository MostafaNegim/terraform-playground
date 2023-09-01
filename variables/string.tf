provider "null" {}

variable "str-1" {
  default = "Mostafa"
  type = string
  
}

output "str-1" {
  value = var.str-1
}