resource "nexus_security_anonymous" "security_anonymous" {
  for_each = var.nexus_security_anonymous

  enabled    = each.value.enabled
  user_id    = each.value.user_id
  realm_name = each.value.realm_name

  depends_on = [nexus_security_user.security_user]
}
