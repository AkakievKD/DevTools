resource "minio_iam_policy" "iam_policy" {
  for_each    = { for key, value in var.minio_iam_policy : key => value }
  name        = each.value.name
  policy      = each.value.policy
  name_prefix = each.value.name_prefix
}
