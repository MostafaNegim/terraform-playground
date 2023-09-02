variable "tags" {
  description = ""
  type = map(string)
  default = {
    "Team" = "DevOps"
    "Environment" = "Dev"
    "App" = "Money"
  }
}

output "tags_out" {
  value = var.tags
}