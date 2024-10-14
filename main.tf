resource "google_network_connectivity_service_connection_policy" "service_connection_policies" {
  for_each      = var.service_connection_policies
  project       = each.value.network_project
  name          = each.key
  location      = var.region
  service_class = "gcp-memorystore-redis"
  description   = lookup(each.value, "description", null)
  network       = "projects/${each.value.network_project}/global/networks/${each.value.network_name}"
  labels        = each.value.labels

  psc_config {
    subnetworks = [for x in each.value.subnet_names : "projects/${each.value.network_project}/regions/${var.region}/subnetworks/${x}"]
    limit       = lookup(each.value, "limit", null)
  }
}
