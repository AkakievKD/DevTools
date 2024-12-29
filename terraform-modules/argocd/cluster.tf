resource "argocd_cluster" "kubernetes" {
  for_each   = { for key, value in var.argocd_cluster : key => value }
  server     = each.value.server
  name       = each.key
  namespaces = each.value.namespaces
  project    = each.value.project
  shard      = each.value.shard

  metadata {
    annotations = each.value.annotations
    labels      = each.value.labels
  }

  config {
    bearer_token = each.value.bearer_token
    password     = each.value.password
    username     = each.value.username

    dynamic "aws_auth_config" {
      for_each = can(each.value.aws_auth_config) && each.value.aws_auth_config != null ? each.value.aws_auth_config : []
      content {
        cluster_name = aws_auth_config.value.cluster_name
        role_arn     = aws_auth_config.value.role_arn
      }
    }

    dynamic "exec_provider_config" {
      for_each = can(each.value.exec_provider_config) && each.value.exec_provider_config != null ? [each.value.exec_provider_config] : []
      content {
        api_version  = exec_provider_config.value.api_version
        args         = exec_provider_config.value.args
        command      = exec_provider_config.value.command
        env          = exec_provider_config.value.env
        install_hint = exec_provider_config.value.install_hint
      }
    }

    dynamic "tls_client_config" {
      for_each = can(each.value.tls_client_config) && each.value.tls_client_config != null ? [each.value.tls_client_config] : []
      content {
        ca_data     = tls_client_config.value.ca_data
        cert_data   = tls_client_config.value.cert_data
        key_data    = tls_client_config.value.key_data
        insecure    = tls_client_config.value.insecure
        server_name = exec_provider_config.value.server_name
      }
    }
  }
}
