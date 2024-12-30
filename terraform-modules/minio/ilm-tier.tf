resource "minio_ilm_tier" "example" {
  for_each              = { for key, value in var.minio_ilm_tier : key => value }
  bucket                = each.value.bucket
  name                  = each.key
  type                  = each.value.type
  endpoint              = each.value.endpoint
  force_new_credentials = each.value.force_new_credentials
  prefix                = each.value.prefix
  region                = each.value.region

  dynamic "s3_config" {
    for_each = can(each.value.s3_config) && each.value.s3_config != null ? [each.value.s3_config] : []
    content {
      access_key    = s3_config.value.access_key
      secret_key    = s3_config.value.secret_key
      storage_class = s3_config.value.storage_class
    }
  }

  dynamic "azure_config" {
    for_each = can(each.value.azure_config) && each.value.azure_config != null ? [each.value.azure_config] : []
    content {
      account_name  = azure_config.value.account_name
      account_key   = azure_config.value.account_key
      storage_class = azure_config.value.storage_class
    }
  }

  dynamic "gcs_config" {
    for_each = can(each.value.gcs_config) && each.value.gcs_config != null ? [each.value.gcs_config] : []
    content {
      credentials   = gcs_config.value.credentials
      storage_class = gcs_config.value.storage_classs
    }
  }

  dynamic "minio_config" {
    for_each = can(each.value.minio_config) && each.value.minio_config != null ? [each.value.minio_config] : []
    content {
      access_key = minio_config.value.access_key
      secret_key = minio_config.value.secret_key
    }
  }
}
