resource "minio_ilm_policy" "ilm_policy" {
  for_each = { for key in var.minio_ilm_policy : key.bucket => key }
  bucket   = each.value.bucket

  dynamic "rule" {
    for_each = can(each.value.rule) && each.value.rule != null ? each.value.rule : []
    content {
      id         = rule.value.id
      expiration = rule.value.expiration
      filter     = rule.value.filter
      tags       = rule.value.tags

      dynamic "transition" {
        for_each = can(rule.value.transition) && rule.value.transition != null ? [rule.value.transition] : []
        content {
          storage_class = transition.value.storage_class
          days          = transition.value.days
          date          = transition.value.date
        }
      }

      dynamic "noncurrent_transition" {
        for_each = can(rule.value.noncurrent_transition) && rule.value.noncurrent_transition != null ? [rule.value.noncurrent_transition] : []
        content {
          storage_class  = noncurrent_transition.value.storage_class
          days           = noncurrent_transition.value.days
          newer_versions = noncurrent_transition.value.newer_versions
        }
      }

      dynamic "noncurrent_expiration" {
        for_each = can(rule.value.noncurrent_expiration) && rule.value.noncurrent_expiration != null ? [rule.value.noncurrent_expiration] : []
        content {
          days           = noncurrent_expiration.value.days
          newer_versions = noncurrent_expiration.value.newer_versions
        }
      }
    }
  }
}
