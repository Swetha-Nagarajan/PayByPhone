#missed provider block ( added )
# Provider Block
provider "aws" {
  region  = "us-west-2"
  profile = "default"
}

module "aws_resource_naming" {
  source = "./aws_resource_naming"

  domain      = "data"
  environment = "production"
  service_name = "foobar"
}

  
resource "aws_s3_bucket" "naming_bucket" {
bucket = module.aws_resource_naming.name
}
