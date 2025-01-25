resource "rancher2_global_role_binding" "global_role_binding" {
  for_each = { for key, value in var.rancher2_global_role_binding : key => value }

  name               = each.key
  global_role_id     = each.value.global_role_id
  user_id            = each.value.user_id
  group_principal_id = each.value.group_principal_id
  annotations        = each.value.annotations
  labels             = each.value.labels

  timeouts {
    create = each.value.timeouts_create
    update = each.value.timeouts_update
    delete = each.value.timeouts_delete
  }
}
