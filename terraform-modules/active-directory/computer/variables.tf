variable "ad_computer" {
  type = map(object({
    name        = string
    pre2kname   = optional(string)
    container   = optional(string)
    description = optional(string)
    id          = optional(string)
  }))
  default = {}
}