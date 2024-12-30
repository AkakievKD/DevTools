resource "minio_iam_group_membership" "iam_group_membership" {
  for_each = { for key, value in var.minio_iam_group_membership : key => value }
  name     = each.key
  group    = each.value.group
  users    = each.value.users
}
