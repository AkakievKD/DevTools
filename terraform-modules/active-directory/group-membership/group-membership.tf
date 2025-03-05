resource "ad_group_membership" "group_membership" {
  for_each = var.ad_group_membership

  group_id      = each.value.group_id
  group_members = each.value.group_members
}
