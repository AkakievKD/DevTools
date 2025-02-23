resource "grafana_service_account" "service_account" {
  for_each = var.grafana_service_account

  name        = each.value.name
  role        = each.value.role
  is_disabled = each.value.is_disabled
  org_id      = each.value.org_id
}
