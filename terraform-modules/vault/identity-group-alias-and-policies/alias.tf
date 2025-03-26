resource "vault_identity_group_alias" "group_alias" {
  for_each = var.vault_identity_group_alias

  name           = each.value.name
  namespace      = each.value.namespace
  mount_accessor = each.value.mount_accessor
  canonical_id   = each.value.canonical_id
}
