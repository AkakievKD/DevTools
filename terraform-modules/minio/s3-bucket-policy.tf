resource "minio_s3_bucket_policy" "s3_bucket_policy" {
  for_each = { for key in var.minio_s3_bucket_policy : key.bucket => key }
  bucket   = each.value.bucket
  policy   = each.value.policy
}

