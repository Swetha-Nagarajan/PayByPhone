#missed provider block ( added )
# Provider Block
provider "aws" {
  region  = "us-west-2"
  profile = "default"
}

module "aws_resource_naming" {
  source = "./aws_resource_naming"
}
