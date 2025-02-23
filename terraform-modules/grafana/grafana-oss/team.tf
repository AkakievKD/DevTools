resource "grafana_team" "team" {
  for_each = var.grafana_team

  name                             = each.value.name
  email                            = each.value.email
  ignore_externally_synced_members = each.value.ignore_externally_synced_members
  members                          = each.value.members
  org_id                           = each.value.org_id

  preferences {
    home_dashboard_uid = each.value.preferences_home_dashboard_uid
    theme              = each.value.preferences_theme
    timezone           = each.value.preferences_timezone
    week_start         = each.value.preferences_week_start
  }

  team_sync {
    groups = each.value.team_sync_groups
  }
}
