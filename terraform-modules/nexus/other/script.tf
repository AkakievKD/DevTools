resource "nexus_script" "script" {
  for_each = { for key, value in var.nexus_script : key => value }

  name    = each.key
  type    = each.value.type
  content = each.value.content
}
