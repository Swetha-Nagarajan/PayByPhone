# Output variable definitions

output "name" {
  value = var.case == "title" ? title(local.name) : var.case == "upper" ? upper(local.name) : lower(local.name)
}
