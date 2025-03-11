resource "nexus_security_ldap_order" "security_ldap_order" {
  for_each = var.nexus_security_ldap_order

  order = each.value.order
}
