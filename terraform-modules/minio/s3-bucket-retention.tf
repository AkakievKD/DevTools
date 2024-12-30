resource "minio_s3_bucket_retention" "s3_bucket_retention" {
  for_each        = { for key in var.minio_s3_bucket_retention : key.bucket => key }
  bucket          = each.value.bucket
  mode            = each.value.mode
  unit            = each.value.unit
  validity_period = each.value.validity_period
}
