resource "minio_iam_ldap_user_policy_attachment" "iam_ldap_user_policy_attachment" {
  for_each    = { for key, value in var.minio_iam_ldap_user_policy_attachment : key => value }
  user_dn     = each.value.user_dn
  policy_name = each.value.policy_name
}
