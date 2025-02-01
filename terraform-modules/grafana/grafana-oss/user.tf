resource "grafana_user" "user" {
  for_each = { for key, value in var.grafana_user : key => value }

  email    = each.key
  name     = each.value.name
  login    = each.value.login
  password = each.value.password
  is_admin = each.value.is_admin
}
