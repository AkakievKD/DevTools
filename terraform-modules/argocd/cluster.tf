resource "argocd_cluster" "kubernetes" {
  for_each = { for key, value in var.argocd_cluster : key => value }
  server   = each.value.server
  name     = each.key

  config {
    dynamic "tls_client_config" {
      for_each = can(each.value.tls_client_config) && each.value.tls_client_config != null ? [each.value.tls_client_config] : []
      content {
        ca_data   = try(tls_client_config.value.ca_data, null)
        cert_data = try(tls_client_config.value.cert_data, null)
        key_data  = try(tls_client_config.value.key_data, null)
        insecure  = try(tls_client_config.value.insecure, null)
      }
    }
  }
}
