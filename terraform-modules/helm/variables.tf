variable "helm" {
  type = map(object({
    chart                      = string
    namespace                  = string
    version                    = optional(string, null)
    timeout                    = optional(number, 1000)
    create_namespace           = optional(bool, false)
    atomic                     = optional(bool, true)
    cleanup_on_fail            = optional(bool, true)
    max_history                = optional(number, 10)
    dependency_update          = optional(bool, false)
    description                = optional(string, null)
    devel                      = optional(bool, false)
    disable_crd_hooks          = optional(bool, false)
    disable_openapi_validation = optional(bool, false)
    disable_webhooks           = optional(bool, false)
    force_update               = optional(bool, false)
    lint                       = optional(bool, false)
    keyring                    = optional(string, null)
    pass_credentials           = optional(bool, false)
    recreate_pods              = optional(bool, false)
    render_subchart_notes      = optional(bool, true)
    replace                    = optional(bool, false)
    repository                 = optional(string, null)
    repository_ca_file         = optional(string, null)
    repository_cert_file       = optional(string, null)
    repository_key_file        = optional(string, null)
    repository_password        = optional(string, null)
    repository_username        = optional(string, null)
    reset_values               = optional(bool, false)
    reuse_values               = optional(bool, false)
    skip_crds                  = optional(bool, false)
    upgrade_install            = optional(bool)
    values                     = optional(list(string), [])
    verify                     = optional(bool, false)
    wait                       = optional(bool, true)
    wait_for_jobs              = optional(string, null)

    postrender = optional(list(object({
      binary_path = optional(string)
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
    name                       = string
    api_versions               = optional(list(string), [])
    atomic                     = optional(bool, false)
    crds                       = optional(list(string), [])
    create_namespace           = optional(bool, false)
    dependency_update          = optional(bool, false)
    description                = optional(string)
    devel                      = optional(bool, false)
    disable_openapi_validation = optional(bool, false)
    disable_webhooks           = optional(bool, false)
    include_crds               = optional(bool, false)
    is_upgrade                 = optional(bool, false)
    keyring                    = optional(string, null)
    kube_version               = optional(string)
    manifest                   = optional(string)
    manifests                  = optional(map(string), {})
    namespace                  = optional(string, null)
    notes                      = optional(string)
    pass_credentials           = optional(bool, false)
    show_only                  = optional(list(string), [])
    skip_crds                  = optional(bool, false)
    skip_tests                 = optional(bool, false)
    timeout                    = optional(number, 1000)
    validate                   = optional(bool, false)
    values                     = optional(list(string), [])
    verify                     = optional(bool, false)
    version                    = optional(string)
    wait                       = optional(bool, true)
    render_subchart_notes      = optional(bool, true)
    replace                    = optional(bool, false)
    repository                 = optional(string)
    repository_ca_file         = optional(string)
    repository_cert_file       = optional(string)
    repository_key_file        = optional(string)
    repository_password        = optional(string)
    repository_username        = optional(string)
    reset_values               = optional(bool, false)
    reuse_values               = optional(bool, false)

    postrender = optional(list(object({
      binary_path = optional(string)
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
