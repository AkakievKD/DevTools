resource "nexus_security_realms" "security_realms" {
  count = var.nexus_security_realms == null ? 0 : 1

  active = var.nexus_security_realms.active
}
