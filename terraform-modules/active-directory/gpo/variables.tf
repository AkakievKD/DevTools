variable "ad_gpo" {
  type = map(object({
    name        = string
    description = optional(string)
    domain      = optional(string)
    id          = optional(string)
    status      = optional(string)
  }))
  default = {}
}