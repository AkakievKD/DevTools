resource "grafana_organization_preferences" "organization_preferences" {
  for_each = { for key in var.grafana_organization_preferences : key.org_id => key }

  home_dashboard_uid = each.value.home_dashboard_uid
  theme              = each.value.theme
  timezone           = each.value.timezone
  week_start         = each.value.week_start
  org_id             = each.value.org_id
}
