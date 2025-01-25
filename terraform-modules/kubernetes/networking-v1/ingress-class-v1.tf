resource "kubernetes_ingress_class_v1" "ingress_class_v1" {
  for_each = { for key in var.kubernetes_ingress_class_v1 : key.name => key }

  metadata {
    name          = each.value.name
    labels        = each.value.labels
    annotations   = each.value.annotations
    generate_name = each.value.generate_name
  }

  spec {
    controller = each.value.controller

    dynamic "parameters" {
      for_each = each.value.parameters
      content {
        kind      = parameters.value.kind
        name      = parameters.value.name
        namespace = parameters.value.namespace
        api_group = parameters.value.api_group
        scope     = parameters.value.scope
      }
    }
  }
}
