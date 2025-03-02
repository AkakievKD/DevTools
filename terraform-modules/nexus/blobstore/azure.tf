resource "nexus_blobstore_azure" "blobstore_azure" {
  for_each = { for key, value in var.nexus_blobstore_azure : key => value }

  name = each.key

  bucket_configuration {
    account_name   = each.value.bucket_configuration_account_name
    container_name = each.value.bucket_configuration_container_name

    authentication {
      authentication_method = each.value.authentication_method
      account_key           = each.value.authentication_account_key
    }
  }

  dynamic "soft_quota" {
    for_each = can(each.value.soft_quota) && each.value.soft_quota != null ? [each.value.soft_quota] : []
    content {
      limit = soft_quota.value.limit
      type  = soft_quota.value.type
    }
  }
}
