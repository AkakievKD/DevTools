resource "kubernetes_endpoint_slice" "endpoint_slice" {
  for_each = { for key, value in var.kubernetes_endpoint_slice : key => value }

  metadata {
    name          = each.key
    labels        = each.value.labels
    annotations   = each.value.annotations
    namespace     = each.value.namespace
    generate_name = each.value.generate_name
  }

  address_type = each.value.address_type

  endpoint {
    addresses = each.value.endpoint_addresses
    hostname  = each.value.endpoint_hostname
    node_name = each.value.endpoint_node_name
    zone      = each.value.endpoint_zone

    condition {
      ready       = each.value.condition_ready
      serving     = each.value.condition_serving
      terminating = each.value.condition_terminating
    }

    target_ref {
      name             = each.value.target_ref_name
      namespace        = each.value.target_ref_namespace
      field_path       = each.value.target_ref_field_path
      resource_version = each.value.target_ref_resource_version
      uid              = each.value.target_ref_uid
    }
  }

  dynamic "port" {
    for_each = each.value.port
    content {
      port         = port.value.port
      app_protocol = port.value.app_protocol
      protocol     = port.value.protocol
      name         = port.value.name
    }
  }
}
