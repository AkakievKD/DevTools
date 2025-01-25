resource "kubernetes_role" "role" {
  for_each = { for key, value in var.kubernetes_role : key => value }

  metadata {
    name          = each.key
    labels        = each.value.labels
    annotations   = each.value.annotations
    generate_name = each.value.generate_name
    namespace     = each.value.namespace
  }

  dynamic "rule" {
    for_each = each.value.role_ref
    content {
      api_groups     = each.value.api_group
      resources      = each.value.resources
      verbs          = each.value.verbs
      resource_names = each.value.resource_names
    }
  }
}
