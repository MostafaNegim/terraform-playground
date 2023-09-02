variable "object_ex" {
  description = ""
  type = object({
    name = string
    num = number
    enable = bool
  })
  default = {
    enable = false
    num = 3
    name = "Config"
  }
}

output "object_out" {
  value = var.object_ex
}