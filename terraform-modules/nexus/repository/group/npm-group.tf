resource "nexus_repository_npm_group" "repository_npm_group" {
  for_each = { for key, value in var.nexus_repository_npm_group : key => value }

  name   = each.key
  online = each.value.online

  group {
    member_names    = each.value.group_member_names
    writable_member = each.value.group_writable_member
  }

  storage {
    blob_store_name                = each.value.storage_blob_store_name
    strict_content_type_validation = each.value.storage_strict_content_type_validation
  }
}