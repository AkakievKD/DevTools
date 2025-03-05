resource "ad_gplink" "gplink" {
  for_each = var.ad_gplink

  gpo_guid  = each.value.gpo_guid
  target_dn = each.value.target_dn
  enforced  = each.value.enforced
  enabled   = each.value.enabled
  id        = each.value.id
  order     = each.value.order
}
