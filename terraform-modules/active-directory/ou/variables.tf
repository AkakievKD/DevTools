variable "ad_ou" {
  type = map(object({
    name        = string
    path        = optional(string)
    description = optional(string)
    protected   = optional(bool)
    id          = optional(string)
  }))
  default = {}
}