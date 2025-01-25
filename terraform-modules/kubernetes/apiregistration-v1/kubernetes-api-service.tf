resource "kubernetes_api_service" "api_service" {
  for_each = { for key, value in var.kubernetes_api_service : key => value }

  metadata {
    name          = each.key
    generate_name = each.value.generate_name
    annotations   = each.value.annotations
    labels        = each.value.labels
  }

  spec {
    group                    = each.value.group
    group_priority_minimum   = each.value.group_priority_minimum
    version                  = each.value.version
    version_priority         = each.value.version_priority
    ca_bundle                = each.value.ca_bundle
    insecure_skip_tls_verify = each.value.insecure_skip_tls_verify

    service {
      name      = each.value.name
      namespace = each.value.namespace
      port      = each.value.port
    }
  }
}
