resource "grafana_data_source_config" "data_source_config" {
  for_each = { for key in var.grafana_data_source_config : key.uid => key }

  http_headers             = each.value.http_headers
  json_data_encoded        = each.value.json_data_encoded
  org_id                   = each.value.org_id
  secure_json_data_encoded = each.value.secure_json_data_encoded
  uid                      = each.value.uid
}
