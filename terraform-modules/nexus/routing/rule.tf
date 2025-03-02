resource "nexus_routing_rule" "routing_rule" {
  for_each = { for key, value in var.nexus_routing_rule : key => value }

  name        = each.key
  description = each.value.description
  mode        = each.value.mode
  matchers    = each.value.matchers
}
