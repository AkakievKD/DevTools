resource "minio_s3_bucket_server_side_encryption" "s3_bucket_server_side_encryption" {
  for_each        = { for key in var.minio_s3_bucket_server_side_encryption : key.bucket => key }
  bucket          = each.value.bucket
  encryption_type = each.value.encryption_type
  kms_key_id      = each.value.kms_key_id
}
