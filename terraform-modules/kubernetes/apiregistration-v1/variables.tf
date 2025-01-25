variable "kubernetes_api_service_v1" {
  type = map(object({
    generate_name            = optional(string)
    annotations              = optional(map(string))
    labels                   = optional(map(string))
    group                    = string
    group_priority_minimum   = number
    version                  = string
    version_priority         = number
    ca_bundle                = optional(string)
    insecure_skip_tls_verify = optional(bool)
    service_name             = string
    service_namespace        = string
    service_port             = optional(number)
  }))
  default = {}
}

variable "kubernetes_api_service" {
  type = map(object({
    generate_name            = optional(string)
    annotations              = optional(map(string))
    labels                   = optional(map(string))
    group                    = string
    group_priority_minimum   = number
    version                  = string
    version_priority         = number
    ca_bundle                = optional(string)
    insecure_skip_tls_verify = optional(bool)
    service_name             = string
    service_namespace        = string
    service_port             = optional(number)
  }))
  default = {}
}
