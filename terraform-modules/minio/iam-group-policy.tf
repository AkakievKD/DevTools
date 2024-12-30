resource "minio_iam_group_policy" "iam_group_policy" {
  for_each    = { for key, value in var.minio_iam_group_membership : key => value }
  name        = each.value.name
  group       = each.value.group
  policy      = each.value.policy
  name_prefix = each.value.name_prefix

}
