variable "ad_group" {
  type = map(object({
    name             = string
    sam_account_name = string
    container        = string
    scope            = optional(string)
    category         = optional(string)
    description      = optional(string)
    id               = optional(string)
  }))
  default = {}
}