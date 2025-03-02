resource "nexus_privilege_wildcard" "privilege_wildcard" {
  for_each = var.nexus_privilege_script

  name        = each.value.name
  description = each.value.description
  pattern     = each.value.pattern
}
