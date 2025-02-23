resource "grafana_organization" "organization" {
  for_each = var.grafana_organization

  name                 = each.value.name
  admin_user           = each.value.admin_user
  create_users         = each.value.create_users
  admins               = each.value.admins
  editors              = each.value.editors
  viewers              = each.value.viewers
  users_without_access = each.value.users_without_access
}
