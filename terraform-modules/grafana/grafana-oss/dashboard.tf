locals {
  dashboards = merge(
    [
      for value in var.grafana_dashboard : {
        for file in fileset(value.dashboards_path, "**.json") :
        "${value.dashboards_path}/${file}" => {
          config_json = file("${value.dashboards_path}/${file}")
          folder      = value.folder
          message     = value.message
          org_id      = value.org_id
          overwrite   = value.overwrite
        }
      }
    ]...
  )
}

resource "grafana_dashboard" "dashboard" {
  for_each = local.dashboards

  config_json = each.value.config_json
  folder      = each.value.folder
  message     = each.value.message
  org_id      = each.value.org_id
  overwrite   = each.value.overwrite
}
