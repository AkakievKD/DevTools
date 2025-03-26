resource "vault_ldap_auth_backend_group" "backend_group" {
  for_each = var.vault_ldap_auth_backend_group

  namespace = each.value.namespace
  groupname = each.value.groupname
  policies  = each.value.policies
  backend   = vault_ldap_auth_backend.backend[0].path
}
