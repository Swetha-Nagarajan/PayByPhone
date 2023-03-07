# Provider Block
provider "aws" {
  region  = "us-west-2"
  profile = "default"
}


module "aws_resource_naming" {
  source        = "./aws_resource_naming"
  domain        = ""
  service_name  = ""
  environment   = ""
  delimiter     = ""
  case_style    = ""
}

