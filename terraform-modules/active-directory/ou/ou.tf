resource "ad_ou" "ou" {
  for_each = var.ad_ou

  name        = each.value.name
  path        = each.value.path
  description = each.value.description
  protected   = each.value.protected
  id          = each.value.id
}
