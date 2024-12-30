resource "minio_kms_key" "kms_key" {
  for_each = { for key in var.minio_kms_key : key.key_id => key }
  key_id   = each.value.key_id
}
