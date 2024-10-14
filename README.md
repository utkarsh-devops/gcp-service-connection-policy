# Service Connection Policy Module

This Terraform module creates Service Connection Policies for Google Cloud Platform (GCP). Service Connection Policies allow you to privately connect to services like Memorystore from your VPC network without requiring public IPs or NAT.

## Usage

To use this module, you need to define the `service_connection_policies` and `region` variables in your Terraform configuration.

```terraform
module "service_connection_policy" {
  source  = "./modules/service_connection_policy"
  region  = "us-central1"
  service_connection_policies = {
    my-service-connection-policy = {
      description    = "My Service Connection Policy"
      network_name   = "my-network"
      network_project = "my-project"
      subnet_names   = ["my-subnet-1", "my-subnet-2"]
      limit          = 100
      labels = {
        environment = "dev"
      }
    }
  }
}

```

## Variables
| Variable | Description | Type | Default |
|------|-------------|------|---------|

| service_connection_policies |	A map of Service Connection Policy configurations.|	map(object({ description = optional(string), network_name = string, network_project = string, subnet_names = list(string), limit = optional(number), labels = optional(map(string)) })) |	{} | 

| region	| The region to deploy the Service Connection Policies. | 	string | 	- | 

## service_connection_policies
The service_connection_policies variable is a map where each key is the name of the Service Connection Policy and the value is an object with the following attributes:

| Attribute | Description | Type | Required |
|------|-------------|------|---------| 
			
| description	| An optional description of the Service Connection Policy.	| string	| No | 
| network_name | 	The name of the VPC network to connect to the service.	string	Yes |
| network_project |	The project where the VPC network is located.	| string |	Yes |
| subnet_names |	A list of subnets in the VPC network that can access the service.	| list(string)	| Yes |
| limit| An optional limit on the number of connections allowed from the VPC network to the service.	| number	| No |
| labels | An optional map of labels to apply to the Service Connection Policy.	
 map(string) |	No |

## Outputs
This module does not define any outputs.

## Requirements
This module requires Terraform v1.0 or later and the google provider.

## Contributing
Contributions are welcome! Please submit a pull request or open an issue if you have any suggestions or find any bugs.

## License
This module is licensed under the Apache License 2.0. See LICENSE for more details.


