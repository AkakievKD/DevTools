resource "ad_group" "group" {
  for_each = var.ad_group

  name             = each.value.name
  sam_account_name = each.value.sam_account_name
  scope            = each.value.scope
  category         = each.value.category
  container        = each.value.container
  description      = each.value.description
  id               = each.value.id
}
