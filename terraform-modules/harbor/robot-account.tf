resource "harbor_robot_account" "robot_account" {
  for_each    = { for key, value in var.harbor_robot_account : key => value }
  name        = each.key
  description = each.value.description
  level       = each.value.level
  secret      = each.value.secret
  disable     = each.value.disable
  duration    = each.value.duration

  dynamic "permissions" {
    for_each = can(each.value.permissions) && each.value.permissions != null ? each.value.permissions : []
    content {
      kind      = permissions.value.kind
      namespace = permissions.value.namespace

      dynamic "access" {
        for_each = can(permissions.value.access) && permissions.value.access != null ? permissions.value.access : []
        content {
          action   = access.value.action
          resource = access.value.resource
          effect   = access.value.effect
        }
      }
    }
  }
}
