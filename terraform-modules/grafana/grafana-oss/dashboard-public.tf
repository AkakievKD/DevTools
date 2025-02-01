resource "grafana_dashboard_public" "dashboard_public" {
  for_each = { for key in var.grafana_dashboard_public : key.dashboard_uid => key }

  dashboard_uid          = each.value.dashboard_uid
  access_token           = each.value.access_token
  annotations_enabled    = each.value.annotations_enabled
  is_enabled             = each.value.is_enabled
  org_id                 = each.value.org_id
  share                  = each.value.share
  time_selection_enabled = each.value.time_selection_enabled
  uid                    = each.value.uid
}
