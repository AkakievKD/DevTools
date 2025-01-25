variable "kubernetes_csi_driver" {
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
