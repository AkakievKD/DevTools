resource "minio_s3_bucket_replication" "s3_bucket_replication" {
  for_each = { for key in var.minio_iam_ldap_user_policy_attachment : key.bucket => key }
  bucket   = each.value.bucket

  dynamic "rule" {
    for_each = can(each.value.rule) && each.value.rule != null ? each.value.rule : []
    content {
      delete_marker_replication   = rule.value.delete_marker_replication
      delete_replication          = rule.value.delete_replication
      enabled                     = rule.value.enabled
      existing_object_replication = rule.value.existing_object_replication
      metadata_sync               = rule.value.metadata_sync
      prefix                      = rule.value.prefix
      priority                    = rule.value.priority
      tags                        = rule.value.tags

      dynamic "target" {
        for_each = can(rule.value.target) && rule.value.target != null ? [rule.value.target] : []
        content {
          access_key          = target.value.access_key
          bucket              = target.value.bucket
          host                = target.value.host
          bandwidth_limit     = target.value.bandwidth_limit
          disable_proxy       = target.value.disable_proxy
          health_check_period = target.value.health_check_period
          path                = target.value.path
          path_style          = target.value.path_style
          region              = target.value.region
          secret_key          = target.value.secret_key
          secure              = target.value.secure
          storage_class       = target.value.storage_class
          synchronous         = target.value.synchronous
        }
      }
    }
  }
}
