resource "harbor_config_security" "config_security" {
  for_each      = { for key, value in var.harbor_config_security : key => value }
  cve_allowlist = each.value.cve_allowlist
  expires_at    = each.value.expires_at
}
