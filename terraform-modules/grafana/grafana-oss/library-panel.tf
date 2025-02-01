resource "grafana_library_panel" "library_panel" {
  for_each = { for key, value in var.grafana_library_panel : key => value }

  name       = each.key
  model_json = each.value.model_json
  folder_uid = each.value.folder_uid
  org_id     = each.value.org_id
  uid        = each.value.uid
}
