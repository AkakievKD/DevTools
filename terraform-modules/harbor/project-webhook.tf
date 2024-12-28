resource "harbor_project_webhook" "project_webhook" {
  for_each         = { for key, value in var.harbor_project_webhook : key => value }
  name             = each.key
  address          = each.value.address
  project_id       = each.value.project_id
  notify_type      = each.value.notify_type
  auth_header      = each.value.auth_header
  description      = each.value.description
  enabled          = each.value.enabled
  skip_cert_verify = each.value.skip_cert_verify
  events_types     = each.value.events_types
}
