resource "nexus_blobstore_s3" "blobstore_s3" {
  for_each = { for key, value in var.nexus_blobstore_s3 : key => value }

  name = each.key

  bucket_configuration {
    bucket {
      expiration = each.value.bucket_configuration_bucket_expiration
      name       = each.value.bucket_configuration_bucket_name
      region     = each.value.bucket_configuration_bucket_region
      prefix     = each.value.bucket_configuration_bucket_prefix
    }

    dynamic "advanced_bucket_connection" {
      for_each = can(each.value.advanced_bucket_connection) && each.value.advanced_bucket_connection != null ? [each.value.advanced_bucket_connection] : []
      content {
        endpoint                 = advanced_bucket_connection.value.endpoint
        force_path_style         = advanced_bucket_connection.value.force_path_style
        max_connection_pool_size = advanced_bucket_connection.value.max_connection_pool_size
        signer_type              = advanced_bucket_connection.value.signer_type
      }
    }

    dynamic "bucket_security" {
      for_each = can(each.value.bucket_security) && each.value.bucket_security != null ? [each.value.bucket_security] : []
      content {
        access_key_id     = bucket_security.value.access_key_id
        secret_access_key = bucket_security.value.secret_access_key
        role              = bucket_security.value.role
        session_token     = bucket_security.value.session_token
      }
    }

    dynamic "encryption" {
      for_each = can(each.value.encryption) && each.value.encryption != null ? [each.value.encryption] : []
      content {
        encryption_key  = encryption.value.encryption_key
        encryption_type = encryption.value.encryption_type
      }
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
