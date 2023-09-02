resource "null_resource" "count_example" {
  count = length(var.user_names)
  triggers = {
    name = var.user_names[count.index]
  }
}