resource "grafana_library_panel" "library_panel" {
  for_each = var.grafana_library_panel

  name       = each.value.name
  model_json = each.value.model_json
  folder_uid = each.value.folder_uid
  org_id     = each.value.org_id
  uid        = each.value.uid
}
