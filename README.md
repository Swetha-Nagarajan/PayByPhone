# PayByPhone
PayByPhone assignment

# PayByPhone AWS resource naming convention Terraform module

## Description

This Terraform module helps standardize the naming of AWS resources for PayByPhone by enforcing a naming convention and generating random service names when necessary. The naming convention consists of the following components: pbp-{domain}-{service_name}-{environment}. The domain is required and must be one of the accepted values, while the service name and environment are optional.

## Usage

The module can be used by calling it in your Terraform configuration and passing in the required and optional variables. Here's an example:

