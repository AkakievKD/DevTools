resource "nexus_repository_docker_hosted" "repository_docker_hosted" {
  for_each = { for key, value in var.nexus_repository_docker_hosted : key => value }

  name   = each.key
  online = each.value.online

  docker {
    force_basic_auth = each.value.docker_force_basic_auth
    v1_enabled       = each.value.docker_v1_enabled
    http_port        = each.value.docker_http_port
    https_port       = each.value.docker_https_port
    subdomain        = each.value.docker_subdomain
  }

  storage {
    latest_policy                  = each.value.storage_latest_policy
    blob_store_name                = each.value.storage_blob_store_name
    strict_content_type_validation = each.value.storage_strict_content_type_validation
    write_policy                   = each.value.storage_write_policy
  }

  dynamic "cleanup" {
    for_each = each.value.cleanup
    content {
      policy_names = cleanup.value.policy_names
    }
  }

  dynamic "component" {
    for_each = can(each.value.component) && each.value.component != null ? [each.value.component] : []
    content {
      proprietary_components = component.value.proprietary_components
    }
  }
}
