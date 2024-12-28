resource "harbor_immutable_tag_rule" "immutable_tag_rule" {
  for_each       = { for key, value in var.harbor_immutable_tag_rule : key => value }
  disabled       = each.value.disable
  project_id     = each.value.project_id
  repo_matching  = each.value.repo_matching
  repo_excluding = each.value.repo_excluding
  tag_matching   = each.value.tag_matching
  tag_excluding  = each.value.tag_excluding
}
