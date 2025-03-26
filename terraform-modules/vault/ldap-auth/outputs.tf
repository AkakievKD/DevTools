output "vault_ldap_auth_backend_accessor" {
  value = vault_ldap_auth_backend.backend[0].accessor
}
