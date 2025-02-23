resource "grafana_service_account_permission_item" "service_account_permission" {
  for_each = var.grafana_service_account_permission_item

  org_id             = each.value.org_id
  service_account_id = each.value.service_account_id
  permission         = each.value.permission
  team               = each.value.team
  user               = each.value.user
}
