variable "kubernetes_ingress_class_v1" {
  type = list(object({
    name          = string
    labels        = optional(map(string))
    annotations   = optional(map(string))
    generate_name = optional(string)
    controller    = optional(string)

    parameters = optional(list(object({
      kind      = string
      name      = string
      namespace = optional(string)
      api_group = optional(string)
      scope     = optional(string)
    })), [])
  }))
  default = {}
}

variable "kubernetes_ingress_class" {
  type = list(object({
    name          = string
    labels        = optional(map(string))
    annotations   = optional(map(string))
    generate_name = optional(string)
    controller    = optional(string)

    parameters = optional(list(object({
      kind      = string
      name      = string
      namespace = optional(string)
      api_group = optional(string)
      scope     = optional(string)
    })), [])
  }))
  default = {}
}

variable "kubernetes_network_policy" {
  type = list(object({
    name                           = string
    labels                         = optional(map(string))
    annotations                    = optional(map(string))
    generate_name                  = optional(string)
    namespace                      = optional(string)
    spec_pod_selector_match_labels = optional(map(string))
    spec_policy_types              = optional(list(string))

    spec_pod_selector_match_expressions = optional(list(object({
      key      = optional(string)
      operator = optional(string)
      values   = optional(set(string))
    })), [])

    ingress = optional(list(object({
      from = optional(list(object({
        ip_block_cidr                   = optional(string)
        ip_block_except                 = optional(list(string))
        pod_selector_match_labels       = optional(map(string))
        namespace_selector_match_labels = optional(map(string))

        pod_selector_match_expressions = optional(list(object({
          key      = optional(string)
          operator = optional(string)
          values   = optional(set(string))
        })), [])

        namespace_selector_match_expressions = optional(list(object({
          key      = optional(string)
          operator = optional(string)
          values   = optional(set(string))
        })), [])
      })), [])

      ports = optional(list(object({
        port     = optional(number)
        protocol = optional(string)
        end_port = optional(number)
      })), [])
    })), [])

    egress = optional(list(object({
      to = optional(list(object({
        ip_block_cidr                   = optional(string)
        ip_block_except                 = optional(list(string))
        pod_selector_match_labels       = optional(map(string))
        namespace_selector_match_labels = optional(map(string))

        pod_selector_match_expressions = optional(list(object({
          key      = optional(string)
          operator = optional(string)
          values   = optional(set(string))
        })), [])

        namespace_selector_match_expressions = optional(list(object({
          key      = optional(string)
          operator = optional(string)
          values   = optional(set(string))
        })), [])
      })), [])

      ports = optional(list(object({
        port     = optional(number)
        protocol = optional(string)
        end_port = optional(number)
      })), [])
    })), [])
  }))
  default = {}
}

variable "kubernetes_network_policy_v1" {
  type = list(object({
    name                           = string
    labels                         = optional(map(string))
    annotations                    = optional(map(string))
    generate_name                  = optional(string)
    namespace                      = optional(string)
    spec_pod_selector_match_labels = optional(map(string))
    spec_policy_types              = optional(list(string))

    spec_pod_selector_match_expressions = optional(list(object({
      key      = optional(string)
      operator = optional(string)
      values   = optional(set(string))
    })), [])

    ingress = optional(list(object({
      from = optional(list(object({
        ip_block_cidr                   = optional(string)
        ip_block_except                 = optional(list(string))
        pod_selector_match_labels       = optional(map(string))
        namespace_selector_match_labels = optional(map(string))

        pod_selector_match_expressions = optional(list(object({
          key      = optional(string)
          operator = optional(string)
          values   = optional(set(string))
        })), [])

        namespace_selector_match_expressions = optional(list(object({
          key      = optional(string)
          operator = optional(string)
          values   = optional(set(string))
        })), [])
      })), [])

      ports = optional(list(object({
        port     = optional(number)
        protocol = optional(string)
        end_port = optional(number)
      })), [])
    })), [])

    egress = optional(list(object({
      to = optional(list(object({
        ip_block_cidr                   = optional(string)
        ip_block_except                 = optional(list(string))
        pod_selector_match_labels       = optional(map(string))
        namespace_selector_match_labels = optional(map(string))

        pod_selector_match_expressions = optional(list(object({
          key      = optional(string)
          operator = optional(string)
          values   = optional(set(string))
        })), [])

        namespace_selector_match_expressions = optional(list(object({
          key      = optional(string)
          operator = optional(string)
          values   = optional(set(string))
        })), [])
      })), [])

      ports = optional(list(object({
        port     = optional(number)
        protocol = optional(string)
        end_port = optional(number)
      })), [])
    })), [])
  }))
  default = {}
}

variable "kubernetes_ingress_v1" {
  type = map(object({
    labels                              = optional(map(string))
    annotations                         = optional(map(string))
    generate_name                       = optional(string)
    namespace                           = optional(string)
    ingress_class_name                  = optional(string)
    wait_for_load_balancer              = optional(bool)
    timeouts_create                     = optional(string)
    timeouts_delete                     = optional(string)
    default_backend_resource_api_group  = string
    default_backend_resource_kind       = string
    default_backend_resource_name       = string
    default_backend_service_name        = string
    default_backend_service_port_number = optional(number)

    rule = optional(list(object({
      rule_host = optional(string)

      path = list(object({
        path                        = optional(string)
        path_type                   = optional(string)
        backend_resource_api_group  = string
        backend_resource_kind       = string
        backend_resource_name       = string
        backend_service_name        = string
        backend_service_port_number = optional(number)
      }))
    })), [])

    tls = optional(list(object({
      hosts       = optional(list(string))
      secret_name = optional(string)
    })), [])
  }))
  default = {}
}
