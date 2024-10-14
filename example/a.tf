module "service_connection_policy" {
  source = "../"
  region = "us-central1"
  service_connection_policies = {
    my-service-connection-policy = {
      description     = "My Service Connection Policy"
      network_name    = "gcp-vpc"
      network_project = "pocs-370205"
      subnet_names    = ["bastion-host-subnet", "redis-memorystore"]
      limit           = 200
      labels = {
        environment = "dev"
      }
    }
  }
}
