resource "nexus_blobstore_group" "blobstore_group" {
  for_each = { for key, value in var.nexus_blobstore_azure : key => value }

  name        = each.key
  fill_policy = each.value.fill_policy
  members     = each.value.members

  dynamic "soft_quota" {
    for_each = can(each.value.soft_quota) && each.value.soft_quota != null ? [each.value.soft_quota] : []
    content {
      limit = soft_quota.value.limit
      type  = soft_quota.value.type
    }
  }
}
