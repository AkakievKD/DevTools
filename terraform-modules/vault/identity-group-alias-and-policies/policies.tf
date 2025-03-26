resource "vault_identity_group_policies" "group_policies" {
  for_each = var.vault_identity_group_policies

  namespace = each.value.namespace
  policies  = each.value.policies
  exclusive = each.value.exclusive
  group_id  = each.value.group_id
}
