resource "nexus_blobstore_file" "blobstore_file" {
  for_each = var.nexus_blobstore_file

  name = each.value.name
  path = each.value.path

  dynamic "soft_quota" {
    for_each = can(each.value.soft_quota) && each.value.soft_quota != null ? [each.value.soft_quota] : []
    content {
      limit = soft_quota.value.limit
      type  = soft_quota.value.type
    }
  }
}
