resource "grafana_folder" "folder" {
  for_each = var.grafana_folder

  title                        = each.value.title
  uid                          = each.value.uid
  org_id                       = each.value.org_id
  parent_folder_uid            = each.value.parent_folder_uid
  prevent_destroy_if_not_empty = each.value.prevent_destroy_if_not_empty
}
