variable "nexus_script" {
  type = map(object({
    type    = optional(string)
    content = string
  }))
  default = {}
}
