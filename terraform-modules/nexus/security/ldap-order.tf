resource "nexus_security_ldap_order" "security_ldap_order" {
  count = var.nexus_security_ldap_order == null ? 0 : 1

  order = var.nexus_security_ldap_order.order
}
