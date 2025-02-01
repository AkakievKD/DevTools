resource "grafana_data_source" "data_source" {
  for_each = { for key, value in var.grafana_data_source : key => value }

  name                                   = each.key
  type                                   = each.value.type
  url                                    = each.value.url
  access_mode                            = each.value.access_mode
  is_default                             = each.value.is_default
  org_id                                 = each.value.org_id
  basic_auth_enabled                     = each.value.basic_auth_enabled
  basic_auth_username                    = each.value.basic_auth_username
  username                               = each.value.username
  database_name                          = each.value.database_name
  json_data_encoded                      = each.value.json_data_encoded
  secure_json_data_encoded               = each.value.secure_json_data_encoded
  uid                                    = each.value.uid
  http_headers                           = each.value.http_headers
  private_data_source_connect_network_id = each.value.private_data_source_connect_network_id
}
