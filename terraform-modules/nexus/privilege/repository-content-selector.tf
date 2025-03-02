resource "nexus_privilege_repository_content_selector" "privilege_repository_content_selector" {
  for_each = { for key, value in var.nexus_privilege_repository_content_selector : key => value }

  name             = each.key
  description      = each.value.description
  actions          = each.value.actions
  repository       = each.value.repository
  format           = each.value.format
  content_selector = each.value.content_selector
}
