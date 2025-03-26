resource "vault_identity_group_member_group_ids" "group_member_group_ids" {
  for_each = var.vault_identity_group_member_group_ids

  namespace        = each.value.namespace
  exclusive        = each.value.exclusive
  member_group_ids = each.value.member_group_ids
  group_id         = each.value.group_id
}
