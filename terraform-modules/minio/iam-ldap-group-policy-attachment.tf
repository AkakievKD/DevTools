resource "minio_iam_ldap_group_policy_attachment" "iam_ldap_group_policy_attachment" {
  for_each    = { for key, value in var.minio_iam_ldap_group_policy_attachment : key => value }
  group_dn    = each.value.group_dn
  policy_name = each.value.policy_name
}
