ephemeral "kubernetes_token_request_v1" "ephemeral_token_request_v1" {
  for_each = { for key in var.ephemeral_kubernetes_token_request_v1 : key.name => key }

  metadata {
    name      = each.value.name
    namespace = each.value.namespace
  }

  spec {
    audiences          = each.value.audiences
    expiration_seconds = each.value.expiration_seconds

    bound_object_ref {
      api_version = each.value.bound_object_ref_api_version
      kind        = each.value.bound_object_ref_kind
      name        = each.value.bound_object_ref_name
      uid         = each.value.bound_object_ref_uid
    }
  }
}
