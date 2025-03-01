resource "nexus_repository_docker_group" "repository_docker_group" {
  for_each = { for key, value in var.nexus_repository_docker_group : key => value }

  name   = each.key
  online = each.value.online

  docker {
    force_basic_auth = each.value.docker_force_basic_auth
    v1_enabled       = each.value.docker_v1_enabled
    http_port        = each.value.docker_http_port
    https_port       = each.value.docker_https_port
    subdomain        = each.value.docker_subdomain
  }

  group {
    member_names    = each.value.group_member_names
    writable_member = each.value.group_writable_member
  }

  storage {
    blob_store_name                = each.value.storage_blob_store_name
    strict_content_type_validation = each.value.storage_strict_content_type_validation
  }
}
