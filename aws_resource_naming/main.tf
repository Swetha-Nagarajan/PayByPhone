#terraform block

terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Provider Block
provider "aws" {
  region  = "us-west-2"
  profile = "default"
}



variable "domain" {
  type        = string
  description = "The domain of the AWS resource"
  validation {
    condition     = can(index(["reporting", "data", "platform", "frontend", "backend"], lower(var.domain)))
    error_message = "Domain must be one of reporting, data, platform, frontend, or backend"
  }
}

variable "service_name" {
  description = "Name of the AWS service"
}



variable "environment" {
  description = "Environment of the AWS resource"
  validation {
    condition     = can(index(["development", "production"], lower(var.environment)))
    error_message = "Environment must be one of development or production"
  }
}

variable "delimiter" {
  description = "Delimiter used to separate the different components of the AWS resource name"
  default     = "-"
}

variable "case_style" {
  type        = string
  default     = "lower"
  description = "The case to output the resource name in (lower, title, or upper)"
}

resource "random_string" "service_name" {
  length  = 8
  special = false
}


locals {
  random_service_name = random_string.generate.result
  service_name        = var.service_name != "" ? var.service_name : local.random_service_name

  name_components = [
     "pbp",
     var.domain,
     local.service_name,
     var.environment,

    ]
}


resource "random_string" "generate" {
  length  = 8
  special = false
}

output "resource_name" {
  value = join(var.delimiter, [
    for i, component in local.name_components: var.case_style == "lower" ? lower(component) :
    var.case_style == "title" ? title(component) :
    var.case_style == "upper" ? upper(component) :
    component
  ])
}
