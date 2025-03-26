output "vault_identity_group_id" {
  value = {
    for key, value in vault_identity_group.group : key => value.id
  }
}
