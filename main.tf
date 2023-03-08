# Provider Block
provider "aws" {
  region  = "us-west-2"
  profile = "default"
}


module "aws_resource_naming" {
  source        = "./aws_resource_naming"
  domain        = "data"
  service_name  = "foobar"
  environment   = "production"
  delimiter     = "-"
  case_style    = "lower"
}

