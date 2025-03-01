resource "nexus_repository_rubygems_group" "repository_rubygems_group" {
  for_each = { for key, value in var.nexus_repository_rubygems_group : key => value }

  name   = each.key
  online = each.value.online

  group {
    member_names = each.value.group_member_names
  }

  storage {
    blob_store_name                = each.value.storage_blob_store_name
    strict_content_type_validation = each.value.storage_strict_content_type_validation
  }
}
