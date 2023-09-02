variable "subnet_ids" {
  type = list(string)
  default = ["subnet-abcde012", "subnet-bcde012a", "subnet-fghi345a"]
}

output "subnets" {
  value = var.subnet_ids
}