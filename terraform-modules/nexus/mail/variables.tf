variable "nexus_mail_config" {
  type = map(object({
    port                              = number
    host                              = string
    from_address                      = string
    enabled                           = optional(bool)
    username                          = optional(string)
    password                          = optional(string)
    subject_prefix                    = optional(string)
    start_tls_enabled                 = optional(bool)
    start_tls_required                = optional(bool)
    ssl_on_connect_enabled            = optional(bool)
    nexus_trust_store_enabled         = optional(bool)
    ssl_server_identity_check_enabled = optional(bool)
  }))
  default = {}
}
