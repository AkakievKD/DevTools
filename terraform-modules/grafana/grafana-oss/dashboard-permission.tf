resource "grafana_dashboard_permission" "dashboard_permission" {
  for_each = { for key in var.grafana_dashboard_permission : key.dashboard_uid => key }

  dashboard_uid = each.value.dashboard_uid
  org_id        = each.value.org_id

  dynamic "permissions" {
    for_each = each.value.permissions
    content {
      permission = permissions.value.permission
      role       = permissions.value.role
      team_id    = permissions.value.team_id
      user_id    = permissions.value.user_id
    }
  }
}
