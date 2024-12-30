resource "minio_s3_bucket_notification" "s3_bucket_notification" {
  for_each = { for key in var.minio_ilm_policy : key.bucket => key }
  bucket   = each.value.bucket

  dynamic "queue" {
    for_each = can(each.value.queue) && each.value.queue != null ? [each.value.queue] : []
    content {
      events        = queue.value.events
      queue_arn     = queue.value.queue_arn
      filter_prefix = queue.value.filter_prefix
      filter_suffix = queue.value.filter_suffix
      id            = queue.value.id
    }
  }
}
