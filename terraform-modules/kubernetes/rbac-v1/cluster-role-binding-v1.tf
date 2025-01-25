resource "kubernetes_cluster_role_binding_v1" "cluster_role_binding_v1" {
  for_each = { for key, value in var.kubernetes_cluster_role_binding_v1 : key => value }

  metadata {
    name          = each.key
    labels        = each.value.labels
    annotations   = each.value.annotations
    generate_name = each.value.generate_name
  }

  dynamic "role_ref" {
    for_each = each.value.role_ref
    content {
      api_group = each.value.api_group
      kind      = each.value.kind
      name      = each.value.name
    }
  }

  dynamic "subject" {
    for_each = each.value.subject
    content {
      kind      = each.value.kind
      name      = each.value.name
      api_group = each.value.api_group
      namespace = each.value.namespace
    }
  }
}
