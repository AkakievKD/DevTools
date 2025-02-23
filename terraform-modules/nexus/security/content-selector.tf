resource "nexus_security_content_selector" "security_content_selector" {
  for_each = var.nexus_security_content_selector

  name        = each.value.name
  description = each.value.description
  expression  = each.value.expression
}
