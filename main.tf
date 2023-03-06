

resource "random_id" "service_name_random" {
  keepers = {
    domain = var.domain
  }

  byte_length = 4
}

locals {
  reordered_components = sort(var.components_list)
  name_components = [
    "pbp",
    var.domain,
    var.service_name != random_id.service_name_random.hex ? var.service_name : null,
    var.environment
  ]
  name_components = [for c in name_components : c if c != null]
  name = join(var.delimiter, name_components)
}
