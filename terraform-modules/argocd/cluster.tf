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
      for_each = { for i in each.value.source : format("%s-%s", i.cluster_name, i.role_arn) => i }
      content {
        cluster_name = aws_auth_config.value.cluster_name
        role_arn     = aws_auth_config.value.role_arn
      }
    }

    dynamic "exec_provider_config" {
      for_each = can(each.value.exec_provider_config) && each.value.exec_provider_config != null ? [each.value.exec_provider_config] : []
      content {
        api_version  = try(exec_provider_config.value.api_version, null)
        args         = try(exec_provider_config.value.args, null)
        command      = try(exec_provider_config.value.command, null)
        env          = try(exec_provider_config.value.env, null)
        install_hint = try(exec_provider_config.value.install_hint, null)
      }
    }

    dynamic "tls_client_config" {
      for_each = can(each.value.tls_client_config) && each.value.tls_client_config != null ? [each.value.tls_client_config] : []
      content {
        ca_data     = try(tls_client_config.value.ca_data, null)
        cert_data   = try(tls_client_config.value.cert_data, null)
        key_data    = try(tls_client_config.value.key_data, null)
        insecure    = try(tls_client_config.value.insecure, null)
        server_name = try(exec_provider_config.value.server_name, null)
      }
    }
  }
}
