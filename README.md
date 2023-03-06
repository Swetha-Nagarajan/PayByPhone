# PayByPhone
PayByPhone assignment

# PayByPhone AWS resource naming convention Terraform module

## Description

This Terraform module helps standardize the naming of AWS resources for PayByPhone by enforcing a naming convention and generating random service names when necessary. The naming convention consists of the following components: pbp-{domain}-{service_name}-{environment}. The domain is required and must be one of the accepted values, while the service name and environment are optional.

## Usage

The module can be used by calling it in your Terraform configuration and passing in the required and optional variables.
Example usage is provided in ExamplesAndTests file


The output of the module will be the full name of the resource, which can be used in the rest of your Terraform configuration. The output will always be in lowercase, but the case can be changed using the optional `output_case` variable.

## Requirements

- Terraform >= 0.12.0
- AWS provider >= 2.70.0

## Accepted values

The following are the accepted values for the `domain` and `environment` inputs:

### Domain

- reporting
- data
- platform
- frontend
- backend

### Environment

- development
- production

## Limitations

The total character count for the entire name (full name composed of the components listed above plus the delimiters) cannot exceed 50 characters.

## Stretch goals

The module also supports the following stretch goals:

### Allow reordering of components

The order of the components can be changed by specifying them in any order when calling the module. The `pbp-` prefix is always at the start, but the rest can be in any order.

### Allow for any delimiter

The delimiter used to separate the components can be changed by setting the `delimiter` input to any value.

### Allow additional case output

In addition to the default lowercase output, the output case can be set to title or uppercase by setting the `output_case` input to "title" or "upper", respectively.




