resource "nexus_privilege_application" "privilege_application" {
  for_each = { for key, value in var.nexus_privilege_application : key => value }

  name        = each.key
  description = each.value.description
  actions     = each.value.actions
  domain      = each.value.domain
}
