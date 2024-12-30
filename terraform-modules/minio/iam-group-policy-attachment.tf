resource "minio_iam_group_policy_attachment" "iam_group_policy_attachment" {
  for_each    = { for key in var.minio_iam_group_policy_attachment : key.group_name => key }
  group_name  = each.value.group_name
  policy_name = each.value.policy_name
}
