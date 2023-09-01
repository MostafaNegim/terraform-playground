provider "null" {}

variable "str-1" {
  default = "Mostafa"
  type = string
  
}

output "out" {
  value = var.str-1
}