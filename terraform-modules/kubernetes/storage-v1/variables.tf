variable "kubernetes_csi_driver_v1" {
  type = list(object({
    name                   = string
    generate_name          = optional(string)
    annotations            = optional(map(string))
    labels                 = optional(map(string))
    attach_required        = bool
    pod_info_on_mount      = optional(bool)
    volume_lifecycle_modes = optional(list(string))
  }))
  default = []
}

variable "kubernetes_storage_class_v1" {
  type = map(object({
    generate_name          = optional(string)
    annotations            = optional(map(string))
    labels                 = optional(map(string))
    storage_provisioner    = string
    allow_volume_expansion = optional(bool)
    reclaim_policy         = optional(string)
    volume_binding_mode    = optional(string)
    mount_options          = optional(set(string))
    parameters             = optional(map(string))

    match_label_expressions = optional(list(object({
      key    = optional(string)
      values = optional(set(string))
    })), [])
  }))
  default = {}
}

variable "kubernetes_storage_class" {
  type = map(object({
    generate_name          = optional(string)
    annotations            = optional(map(string))
    labels                 = optional(map(string))
    storage_provisioner    = string
    allow_volume_expansion = optional(bool)
    reclaim_policy         = optional(string)
    volume_binding_mode    = optional(string)
    mount_options          = optional(set(string))
    parameters             = optional(map(string))

    match_label_expressions = optional(list(object({
      key    = optional(string)
      values = optional(set(string))
    })), [])
  }))
  default = {}
}
