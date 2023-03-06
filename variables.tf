# Input variable definitions


variable "pbp_domain" {
  type        = string
  description = "The domain of the PBP AWS resource"
  validation {
    condition     = can(index(["reporting", "data", "platform", "frontend", "backend"], lower(var.pbp_domain)))
    error_message = "Domain must be one of reporting, data, platform, frontend, or backend"
  }
}

variable "pbp_service_name" {
  type        = string
  default     = random_id.pbp_service_name_suffix.hex
  description = "The name of the service for the PBP AWS resource"
  validation {
    condition     = can(regex("^[a-zA-Z0-9]*$", var.pbp_service_name))
    error_message = "Service name must be alphanumeric and contain no spaces"
  }
}

variable "pbp_environment" {
  type        = string
  description = "The environment of the PBP AWS resource"
  validation {
    condition     = can(index(["development", "production"], lower(var.pbp_environment)))
    error_message = "Environment must be one of development or production"
  }
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "The delimiter to use in the resource name"
}

variable "case" {
  type        = string
  default     = "lower"
  description = "The case to output the resource name in (lower, title, or upper)"
  validation {
    condition     = can(index(["lower", "title", "upper"], lower(var.case)))
    error_message = "Case must be one of lower, title, or upper"
  }
}
