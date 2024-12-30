resource "minio_s3_object" "s3_object" {
  for_each       = { for key in var.minio_s3_object : key.bucket_name => key }
  bucket_name    = each.value.bucket_name
  object_name    = each.value.object_name
  content        = each.value.content
  content_base64 = each.value.content_base64
  content_type   = each.value.content_type
  etag           = each.value.etag
  source         = each.value.source
  version_id     = each.value.version_id
}
