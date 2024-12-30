resource "minio_iam_user" "iam_user" {
  for_each      = { for key, value in var.minio_iam_user : key => value }
  name          = each.key
  force_destroy = each.value.force_destroy
  disable_user  = each.value.disable_user
  secret        = each.value.secret
  update_secret = each.value.update_secret
  tags          = each.value.tags
}
