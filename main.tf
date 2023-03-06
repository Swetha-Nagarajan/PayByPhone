# Create PBP resource naming module

locals {
  component_order = { for idx, component in var.name_components_order: component => idx }
}

resource "random_id" "service_name_suffix" {
  byte_length = 4
}

locals {
  service_name_random = length(trim(var.service_name)) > 0 ? "-${var.service_name}" : "-${random_id.service_name_random.hex}"
}

locals {
  name_components = {
    pbp     = "pbp",
    domain  = var.domain,
    service_name = local.service_name_random,
    environment  = var.environment
  }
}

locals {
  name_components_ordered = { for component in var.name_components_order: component => local.name_components[component] if contains(keys(local.name_components), component) }
}
