resource "harbor_robot_account" "robot_account" {
  for_each    = { for key, value in var.harbor_robot_account : key => value }
  name        = each.key
  description = each.value.description
  level       = each.value.level
  secret      = each.value.secret
  disable     = each.value.disable
  duration    = each.value.duration

  dynamic "permissions" {
    for_each = { for i in each.value.permissions : format("%s-%s", i.kind, i.namespace) => i }
    content {
      kind      = each.value.kind
      namespace = each.value.namespace

      dynamic "access" {
        for_each = { for i in permissions.value.access : format("%s-%s-%s", i.action, i.resource, i.effect) => i }
        content {
          action   = access.value.action
          resource = access.value.resource
          effect   = access.value.effect
        }
      }
    }
  }
}
