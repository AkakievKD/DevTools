resource "nexus_privilege_repository_admin" "privilege_repository_admin" {
  for_each = { for key, value in var.nexus_privilege_repository_admin : key => value }

  name        = each.key
  description = each.value.description
  actions     = each.value.actions
  repository  = each.value.repository
  format      = each.value.format
}
