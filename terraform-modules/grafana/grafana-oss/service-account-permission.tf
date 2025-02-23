resource "grafana_service_account_permission" "service_account_permission" {
  for_each = var.grafana_service_account

  org_id             = each.value.org_id
  service_account_id = each.value.service_account_id

  dynamic "permissions" {
    for_each = each.value.permissions
    content {
      permission = permissions.value.permission
      team_id    = permissions.value.team_id
      user_id    = permissions.value.user_id
    }
  }
}
