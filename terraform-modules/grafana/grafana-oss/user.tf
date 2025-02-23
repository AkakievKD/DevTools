resource "grafana_user" "user" {
  for_each = var.grafana_user

  email    = each.value.email
  name     = each.value.name
  login    = each.value.login
  password = each.value.password
  is_admin = each.value.is_admin
}
