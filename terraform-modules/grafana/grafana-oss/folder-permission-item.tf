resource "grafana_folder_permission_item" "folder_permission_item" {
  for_each = var.grafana_folder_permission_item

  folder_uid = each.value.folder_uid
  team       = each.value.team
  permission = each.value.permission
  role       = each.value.role
  user       = each.value.user
  org_id     = each.value.org_id
}
