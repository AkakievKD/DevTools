resource "harbor_project_member_user" "project_member_user" {
  for_each   = { for key in var.harbor_project_member_user : key.user_name => key }
  project_id = each.value.project_id
  user_name  = each.value.user_name
  role       = each.value.role
}
