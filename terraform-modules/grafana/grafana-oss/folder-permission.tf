resource "grafana_folder_permission" "folder_permission" {
  for_each = var.grafana_folder_permission

  org_id     = each.value.org_id
  folder_uid = each.value.folder_uid

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
