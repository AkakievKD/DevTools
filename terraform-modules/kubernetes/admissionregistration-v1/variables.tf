variable "kubernetes_mutating_webhook_configuration_v1" {
  type = map(object({
    generate_name = optional(string)
    annotations   = optional(map(string))
    labels        = optional(map(string))

    webhook = list(object({
      name                      = string
      admission_review_versions = optional(list(string))
      failure_policy            = optional(string)
      match_policy              = optional(string)
      reinvocation_policy       = optional(string)
      side_effects              = optional(string)
      timeout_seconds           = optional(number)

      client_config = object({
        ca_bundle = optional(string)
        url       = optional(string)

        service = optional(object({
          name      = string
          namespace = string
          path      = optional(string)
          port      = optional(number)
        }), null)
      })

      namespace_selector = optional(object({
        match_labels = optional(map(string))

        match_expressions = optional(list(object({
          key      = optional(string)
          operator = optional(string)
          values   = optional(set(string))
        })), [])
      }), null)

      object_selector = optional(object({
        match_labels = optional(map(string))

        match_expressions = optional(list(object({
          key      = optional(string)
          operator = optional(string)
          values   = optional(set(string))
        })), [])
      }), null)

      rule = optional(list(object({
        api_groups   = list(string)
        api_versions = list(string)
        operations   = list(string)
        resources    = list(string)
        scope        = optional(string)
      })), [])
    }))
  }))
  default = {}
}

variable "kubernetes_validating_webhook_configuration_v1" {
  type = map(object({
    generate_name = optional(string)
    annotations   = optional(map(string))
    labels        = optional(map(string))

    webhook = list(object({
      name                      = string
      admission_review_versions = optional(list(string))
      failure_policy            = optional(string)
      match_policy              = optional(string)
      side_effects              = optional(string)
      timeout_seconds           = optional(number)

      client_config = object({
        ca_bundle = optional(string)
        url       = optional(string)

        service = optional(object({
          name      = string
          namespace = string
          path      = optional(string)
          port      = optional(number)
        }), null)
      })

      namespace_selector = optional(object({
        match_labels = optional(map(string))

        match_expressions = optional(list(object({
          key      = optional(string)
          operator = optional(string)
          values   = optional(set(string))
        })), [])
      }), null)

      object_selector = optional(object({
        match_labels = optional(map(string))

        match_expressions = optional(list(object({
          key      = optional(string)
          operator = optional(string)
          values   = optional(set(string))
        })), [])
      }), null)

      rule = optional(list(object({
        api_groups   = list(string)
        api_versions = list(string)
        operations   = list(string)
        resources    = list(string)
        scope        = optional(string)
      })), [])
    }))
  }))
  default = {}
}
