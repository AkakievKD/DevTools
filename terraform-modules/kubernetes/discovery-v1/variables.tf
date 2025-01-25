variable "kubernetes_endpoint_slice" {
  type = map(object({
    labels                      = optional(map(string))
    annotations                 = optional(map(string))
    generate_name               = optional(string)
    namespace                   = optional(string)
    endpoint_addresses          = optional(list(string))
    endpoint_hostname           = optional(string)
    endpoint_node_name          = optional(string)
    endpoint_zone               = optional(string)
    condition_ready             = optional(bool)
    condition_serving           = optional(bool)
    condition_terminating       = optional(bool)
    target_ref_name             = string
    target_ref_namespace        = optional(string)
    target_ref_field_path       = optional(string)
    target_ref_resource_version = optional(string)
    target_ref_uid              = optional(string)

    port = list(object({
      port         = string
      app_protocol = string
      protocol     = optional(string)
      name         = optional(string)
    }))
  }))
  default = {}
}
