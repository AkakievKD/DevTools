resource "grafana_annotation" "annotation" {
  for_each = { for key in var.grafana_annotation : key.text => key }

  text          = each.value.text
  dashboard_uid = each.value.dashboard_uid
  org_id        = each.value.org_id
  panel_id      = each.value.panel_id
  tags          = each.value.tags
  time          = each.value.time
  time_end      = each.value.time_end
}
