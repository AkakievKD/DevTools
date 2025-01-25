resource "kubernetes_annotations" "annotations" {
  for_each = { for key, value in var.kubernetes_annotations : key => value }

  api_version = each.value.api_version
  kind        = each.value.kind

  metadata {
    name      = each.key
    namespace = each.value.namespace
  }

  annotations          = each.value.annotations
  field_manager        = each.value.field_manager
  force                = each.value.force
  template_annotations = each.value.template_annotations
}
