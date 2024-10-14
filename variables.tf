variable "service_connection_policies" {
  description = "The Service Connection Policies to create"
  type = map(object({
    description     = optional(string)
    network_name    = string
    network_project = string
    subnet_names    = list(string)
    limit           = optional(number)
    labels          = optional(map(string), {})
  }))
  default = {}
}

variable "region" {
  description = "The region to deploy the Service Connection Policies"
  type        = string
}
