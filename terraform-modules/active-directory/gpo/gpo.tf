resource "ad_gpo" "gpo" {
  for_each = var.ad_gpo

  name        = each.value.name
  description = each.value.description
  domain      = each.value.domain
  id          = each.value.id
  status      = each.value.status
}
