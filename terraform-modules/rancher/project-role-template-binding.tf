resource "rancher2_project_role_template_binding" "project_role_template_binding" {
  for_each = { for key, value in var.rancher2_project_role_template_binding : key => value }

  name               = each.key
  project_id         = each.value.project_id
  role_template_id   = each.value.role_template_id
  group_id           = each.value.group_id
  group_principal_id = each.value.group_principal_id
  user_id            = each.value.user_id
  user_principal_id  = each.value.user_principal_id
  annotations        = each.value.annotations
  labels             = each.value.labels

  timeouts {
    create = each.value.timeouts_create
    update = each.value.timeouts_update
    delete = each.value.timeouts_delete
  }
}
