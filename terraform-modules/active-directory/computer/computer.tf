resource "ad_computer" "computer" {
  for_each = var.ad_computer

  name        = each.value.name
  pre2kname   = each.value.pre2kname
  container   = each.value.container
  description = each.value.description
  id          = each.value.id
}
