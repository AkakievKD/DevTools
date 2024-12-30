resource "minio_iam_user_policy_attachment" "iam_user_policy_attachment" {
  for_each    = { for key in var.minio_iam_user_policy_attachment : key.user_name => key }
  user_name   = each.value.user_name
  policy_name = each.value.policy_name
}
