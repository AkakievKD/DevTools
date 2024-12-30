resource "minio_iam_service_account" "iam_service_account" {
  for_each      = { for key in var.minio_iam_service_account : key.target_user => key }
  target_user   = each.value.target_user
  description   = each.value.description
  disable_user  = each.value.disable
  expiration    = each.value.expiration
  name          = each.value.name
  policy        = each.value.policy
  update_secret = each.value.update_secret
}
