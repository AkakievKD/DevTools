variable "helm" {
  type = map(object({
    chart                      = string
    namespace                  = optional(string)
    version                    = optional(string)
    timeout                    = optional(number, 1000)
    create_namespace           = optional(bool)
    atomic                     = optional(bool)
    cleanup_on_fail            = optional(bool)
    max_history                = optional(number, 10)
    dependency_update          = optional(bool)
    description                = optional(string)
    devel                      = optional(bool)
    disable_crd_hooks          = optional(bool)
    disable_openapi_validation = optional(bool)
    disable_webhooks           = optional(bool)
    force_update               = optional(bool)
    lint                       = optional(bool)
    keyring                    = optional(string)
    pass_credentials           = optional(bool)
    recreate_pods              = optional(bool)
    render_subchart_notes      = optional(bool)
    replace                    = optional(bool)
    repository                 = optional(string)
    repository_ca_file         = optional(string)
    repository_cert_file       = optional(string)
    repository_key_file        = optional(string)
    repository_password        = optional(string)
    repository_username        = optional(string)
    reset_values               = optional(bool)
    reuse_values               = optional(bool)
    skip_crds                  = optional(bool)
    upgrade_install            = optional(bool)
    values                     = optional(list(string))
    verify                     = optional(bool)
    wait                       = optional(bool)
    wait_for_jobs              = optional(string)

    postrender = optional(list(object({
      binary_path = string
      args        = optional(list(string), [])
    })), [])

    set = optional(list(object({
      name  = string
      value = string
      type  = optional(string, "string")
    })), [])

    set_list = optional(list(object({
      name  = string
      value = list(string)
    })), [])

    set_sensitive = optional(list(object({
      name  = string
      value = string
      type  = optional(string, "string")
    })), [])
  }))
  default = {}
}

variable "helm_template" {
  type = map(object({
    chart                      = string
    api_versions               = optional(list(string))
    atomic                     = optional(bool)
    crds                       = optional(list(string))
    create_namespace           = optional(bool)
    dependency_update          = optional(bool)
    description                = optional(string)
    devel                      = optional(bool)
    disable_openapi_validation = optional(bool)
    disable_webhooks           = optional(bool)
    include_crds               = optional(bool)
    is_upgrade                 = optional(bool)
    keyring                    = optional(string)
    kube_version               = optional(string)
    manifest                   = optional(string)
    manifests                  = optional(map(string))
    namespace                  = optional(string)
    notes                      = optional(string)
    pass_credentials           = optional(bool)
    show_only                  = optional(list(string))
    skip_crds                  = optional(bool)
    skip_tests                 = optional(bool)
    timeout                    = optional(number, 1000)
    validate                   = optional(bool)
    values                     = optional(list(string))
    verify                     = optional(bool)
    version                    = optional(string)
    wait                       = optional(bool)
    render_subchart_notes      = optional(bool)
    replace                    = optional(bool)
    repository                 = optional(string)
    repository_ca_file         = optional(string)
    repository_cert_file       = optional(string)
    repository_key_file        = optional(string)
    repository_password        = optional(string)
    repository_username        = optional(string)
    reset_values               = optional(bool)
    reuse_values               = optional(bool)

    postrender = optional(list(object({
      binary_path = string
    })), [])

    set = optional(list(object({
      name  = string
      value = string
      type  = optional(string, "string")
    })), [])

    set_list = optional(list(object({
      name  = string
      value = list(string)
    })), [])

    set_sensitive = optional(list(object({
      name  = string
      value = string
      type  = optional(string, "string")
    })), [])
  }))
  default = {}
}
