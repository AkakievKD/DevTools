resource "vault_identity_group_member_entity_ids" "group_member_entity_ids" {
  for_each = var.vault_identity_group_member_entity_ids

  namespace         = each.value.namespace
  exclusive         = each.value.exclusive
  member_entity_ids = each.value.member_entity_ids
  group_id          = each.value.group_id
}
