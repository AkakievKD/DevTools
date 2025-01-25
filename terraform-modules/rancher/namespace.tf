resource "rancher2_namespace" "namespace" {
  for_each = { for key, value in var.rancher2_namespace : key => value }

  name             = each.key
  project_id       = each.value.project_id
  description      = each.value.description
  wait_for_cluster = each.value.wait_for_cluster
  annotations      = each.value.annotations
  labels           = each.value.labels

  container_resource_limit {
    limits_cpu      = each.value.container_resource_limit_limits_cpu
    limits_memory   = each.value.container_resource_limit_limits_memory
    requests_cpu    = each.value.container_resource_limit_requests_cpu
    requests_memory = each.value.container_resource_limit_requests_memory
  }

  resource_quota {
    limit {
      config_maps              = each.value.resource_quota_limit_config_maps
      limits_cpu               = each.value.resource_quota_limit_limits_cpu
      limits_memory            = each.value.resource_quota_limit_limits_memory
      persistent_volume_claims = each.value.resource_quota_limit_persistent_volume_claims
      pods                     = each.value.resource_quota_limit_pods
      replication_controllers  = each.value.resource_quota_limit_replication_controllers
      requests_cpu             = each.value.resource_quota_limit_requests_cpu
      requests_memory          = each.value.resource_quota_limit_requests_memory
      requests_storage         = each.value.resource_quota_limit_requests_storage
      secrets                  = each.value.resource_quota_limit_secrets
      services_load_balancers  = each.value.resource_quota_limit_services_load_balancers
      services_node_ports      = each.value.resource_quota_limit_services_node_ports
    }
  }

  timeouts {
    create = each.value.timeouts_create
    update = each.value.timeouts_update
    delete = each.value.timeouts_delete
  }
}
