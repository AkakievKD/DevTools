resource "nexus_security_role" "security_role" {
  for_each = var.nexus_security_role

  roleid      = each.value.roleid
  name        = each.value.name
  description = each.value.description
  privileges  = each.value.privileges
  roles       = each.value.roles
}
