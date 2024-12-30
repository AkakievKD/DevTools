resource "minio_s3_bucket" "s3_bucket" {
  for_each       = { for key, value in var.minio_s3_bucket : key => value }
  acl            = each.value.acl
  bucket         = each.key
  bucket_prefix  = each.value.bucket_prefix
  force_destroy  = each.value.force_destroy
  object_locking = each.value.object_locking
  quota          = each.value.quota
}
