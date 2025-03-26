resource "vault_identity_group" "group" {
  for_each = var.vault_identity_group

  namespace                  = each.value.namespace
  name                       = each.value.name
  type                       = each.value.type
  policies                   = each.value.policies
  metadata                   = each.value.metadata
  member_group_ids           = each.value.member_group_ids
  member_entity_ids          = each.value.member_entity_ids
  external_policies          = each.value.external_policies
  external_member_entity_ids = each.value.external_member_entity_ids
  external_member_group_ids  = each.value.external_member_group_ids
}
