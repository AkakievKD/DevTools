variable "kubernetes_cluster_role_v1" {
  type = map(object({
    generate_name                       = optional(string)
    annotations                         = optional(map(string))
    labels                              = optional(map(string))
    cluster_role_selectors_match_labels = optional(map(string))

    cluster_role_selectors_match_expressions = optional(list(object({
      key      = optional(string)
      operator = optional(string)
      values   = optional(set(string))
    })), [])

    rule = optional(list(object({
      api_groups        = optional(list(string))
      resources         = optional(list(string))
      verbs             = list(string)
      resource_names    = optional(list(string))
      non_resource_urls = optional(list(string))
    })), [])
  }))
  default = []
}

variable "kubernetes_cluster_role" {
  type = map(object({
    generate_name                       = optional(string)
    annotations                         = optional(map(string))
    labels                              = optional(map(string))
    cluster_role_selectors_match_labels = optional(map(string))

    cluster_role_selectors_match_expressions = optional(list(object({
      key      = optional(string)
      operator = optional(string)
      values   = optional(set(string))
    })), [])

    rule = optional(list(object({
      api_groups        = optional(list(string))
      resources         = optional(list(string))
      verbs             = list(string)
      resource_names    = optional(list(string))
      non_resource_urls = optional(list(string))
    })), [])
  }))
  default = []
}

variable "kubernetes_cluster_role_binding_v1" {
  type = map(object({
    generate_name = optional(string)
    annotations   = optional(map(string))
    labels        = optional(map(string))

    role_ref = list(object({
      api_group = string
      kind      = string
      name      = string
    }))

    subject = list(object({
      kind      = string
      name      = string
      api_group = optional(string)
      namespace = optional(string)
    }))
  }))
  default = []
}

variable "kubernetes_cluster_role_binding" {
  type = map(object({
    generate_name = optional(string)
    annotations   = optional(map(string))
    labels        = optional(map(string))

    role_ref = list(object({
      api_group = string
      kind      = string
      name      = string
    }))

    subject = list(object({
      kind      = string
      name      = string
      api_group = optional(string)
      namespace = optional(string)
    }))
  }))
  default = []
}

variable "kubernetes_role_binding_v1" {
  type = map(object({
    generate_name = optional(string)
    annotations   = optional(map(string))
    labels        = optional(map(string))
    namespace     = optional(string)

    role_ref = list(object({
      api_group = string
      kind      = string
      name      = string
    }))

    subject = list(object({
      kind      = string
      name      = string
      api_group = optional(string)
      namespace = optional(string)
    }))
  }))
  default = []
}

variable "kubernetes_role_binding" {
  type = map(object({
    generate_name = optional(string)
    annotations   = optional(map(string))
    labels        = optional(map(string))
    namespace     = optional(string)

    role_ref = list(object({
      api_group = string
      kind      = string
      name      = string
    }))

    subject = list(object({
      kind      = string
      name      = string
      api_group = optional(string)
      namespace = optional(string)
    }))
  }))
  default = []
}

variable "kubernetes_role_v1" {
  type = map(object({
    generate_name = optional(string)
    annotations   = optional(map(string))
    labels        = optional(map(string))
    namespace     = optional(string)

    rule = list(object({
      api_groups     = set(string)
      resources      = set(string)
      verbs          = set(string)
      resource_names = optional(set(string))
    }))
  }))
  default = []
}

variable "kubernetes_role" {
  type = map(object({
    generate_name = optional(string)
    annotations   = optional(map(string))
    labels        = optional(map(string))
    namespace     = optional(string)

    rule = list(object({
      api_groups     = set(string)
      resources      = set(string)
      verbs          = set(string)
      resource_names = optional(set(string))
    }))
  }))
  default = []
}
