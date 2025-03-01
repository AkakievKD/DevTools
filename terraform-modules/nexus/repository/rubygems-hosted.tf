resource "nexus_repository_rubygems_hosted" "example" {
  for_each = { for key, value in var.nexus_repository_rubygems_hosted : key => value }

  name   = each.key
  online = each.value.online

  storage {
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
