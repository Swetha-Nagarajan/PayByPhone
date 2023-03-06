# Output variable definitions

output "resource_name" {
  value = join(var.delimiter, [ for component in sort(local.name_components_ordered): local.name_components_ordered[component] ])
}
