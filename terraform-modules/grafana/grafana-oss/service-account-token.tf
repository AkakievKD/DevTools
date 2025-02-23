resource "grafana_service_account_token" "service_account_token" {
  for_each = var.grafana_service_account_token

  name               = each.value.name
  service_account_id = each.value.service_account_id
  seconds_to_live    = each.value.seconds_to_live
}
