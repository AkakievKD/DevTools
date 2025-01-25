resource "kubernetes_runtime_class_v1" "example" {
  for_each = { for key in var.kubernetes_runtime_class_v1 : key.name => key }

  metadata {
    name          = each.value.name
    labels        = each.value.labels
    annotations   = each.value.annotations
    generate_name = each.value.generate_name
  }

  handler = each.value.handler
}
