resource "grafana_service_account" "service_account" {
  for_each = { for key, value in var.grafana_service_account : key => value }

  name        = each.key
  role        = each.value.role
  is_disabled = each.value.is_disabled
  org_id      = each.value.org_id
}
