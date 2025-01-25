variable "kubernetes_annotations" {
  type = map(object({
    api_version          = string
    kind                 = string
    namespace            = optional(string)
    annotations          = optional(map(string))
    field_manager        = optional(string)
    force                = optional(bool)
    template_annotations = optional(map(string))
  }))
  default = []
}

variable "kubernetes_labels" {
  type = map(object({
    api_version   = string
    kind          = string
    namespace     = optional(string)
    field_manager = optional(string)
    force         = optional(bool)
    labels        = optional(map(string))
  }))
  default = []
}

variable "kubernetes_manifest" {
  type = map(object({
    manifest                      = any
    computed_fields               = optional(list(string))
    object                        = optional(any)
    field_manager_force_conflicts = optional(bool)
    timeouts_create               = optional(string)
    timeouts_delete               = optional(string)
    timeouts_update               = optional(string)
    wait_rollout                  = optional(bool)
    wait_fields                   = optional(map(string))

    wait_condition = optional(list(object({
      wait_condition_status = optional(string)
      wait_condition_type   = optional(string)
    })), [])
  }))
  default = []
}
