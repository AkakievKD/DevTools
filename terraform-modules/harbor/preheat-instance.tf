resource "harbor_preheat_instance" "preheat_instance" {
  for_each    = { for key, value in var.harbor_preheat_instance : key => value }
  name        = each.key
  vendor      = each.value.vendor
  description = each.value.description
  endpoint    = each.value.endpoint
  auth_mode   = each.value.auth_mode
  username    = each.value.username
  password    = each.value.password
  token       = each.value.token
  default     = each.value.default
  enabled     = each.value.enabled
  insecure    = each.value.insecure
}
