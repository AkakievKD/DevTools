resource "minio_iam_group_user_attachment" "iam_group_user_attachment" {
  for_each   = { for key, value in var.minio_iam_group_user_attachment : key => value }
  group_name = each.value.group_name
  user_name  = each.value.user_name
}
