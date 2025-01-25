resource "kubernetes_labels" "labels" {
  for_each = { for key, value in var.kubernetes_labels : key => value }

  api_version = each.value.api_version
  kind        = each.value.kind

  metadata {
    name      = each.key
    namespace = each.value.namespace
  }

  labels        = each.value.labels
  field_manager = each.value.field_manager
  force         = each.value.force
}
