resource "nexus_security_user_token" "security_user_token" {
  for_each = var.nexus_security_user_token

  enabled            = each.value.enabled
  protect_content    = each.value.protect_content
  expiration_days    = each.value.expiration_days
  expiration_enabled = each.value.expiration_enabled
}
