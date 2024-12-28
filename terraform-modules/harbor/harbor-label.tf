resource "harbor_label" "label" {
  for_each    = { for key in var.harbor_label : key.name => key }
  name        = each.value.name
  color       = each.value.color
  description = each.value.description
  project_id  = each.value.project_id
}
