resource "nexus_privilege_repository_view" "privilege_repository_view" {
  for_each = { for key, value in var.nexus_privilege_repository_view : key => value }

  name        = each.key
  description = each.value.description
  actions     = each.value.actions
  repository  = each.value.repository
  format      = each.value.format
}
