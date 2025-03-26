resource "vault_ldap_auth_backend_user" "backend_user" {
  for_each = var.vault_ldap_auth_backend_user

  username  = each.value.username
  namespace = each.value.namespace
  groups    = each.value.groups
  policies  = each.value.policies
  backend   = vault_ldap_auth_backend.backend[0].path
}
