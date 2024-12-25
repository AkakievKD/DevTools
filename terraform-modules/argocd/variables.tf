variable "argocd_repository" {
  type = list(object({
    repo                          = string
    name                          = optional(string)
    type                          = optional(string, "git")
    password                      = optional(string)
    project                       = optional(string)
    username                      = optional(string)
    insecure                      = optional(bool)
    ssh_private_key               = optional(string)
    enable_lfs                    = optional(bool)
    enable_oci                    = optional(bool)
    githubapp_enterprise_base_url = optional(string)
    githubapp_id                  = optional(string)
    githubapp_installation_id     = optional(string)
    githubapp_private_key         = optional(string)
    tls_client_cert_data          = optional(string)
    tls_client_cert_key           = optional(string)
  }))
  default = []
}

variable "argocd_project_token" {
  type = list(object({
    project      = string
    role         = string
    description  = optional(string)
    expires_in   = optional(string)
    renew_after  = optional(string)
    renew_before = optional(string)
  }))
  default = []
}

variable "argocd_repository_credentials" {
  type = list(object({
    url                           = string
    enable_oci                    = optional(bool)
    githubapp_enterprise_base_url = optional(string)
    githubapp_id                  = optional(string)
    githubapp_installation_id     = optional(string)
    githubapp_private_key         = optional(string)
    password                      = optional(string)
    ssh_private_key               = optional(string)
    tls_client_cert_data          = optional(string)
    tls_client_cert_key           = optional(string)
    username                      = optional(string)
  }))
  default = []
}

variable "argocd_repository_certificate" {
  type = list(object({

    https = optional(object({
      server_name = string
      cert_data   = string
    }), null)

    ssh = optional(object({
      server_name  = string
      cert_data    = string
      cert_subtype = string
    }), null)

  }))
  default = []
}

variable "argocd_gpg_key" {
  type = list(object({
    public_key = string
  }))
  default = []
}

variable "argocd_account_token" {
  type = list(object({
    account      = optional(string)
    expires_in   = optional(string)
    renew_after  = optional(string)
    renew_before = optional(string)
  }))
  default = []
}

variable "argocd_cluster" {
  type = map(object({
    server = string

    tls_client_config = optional(object({
      ca_data   = optional(string) #certificate-authority-data
      cert_data = optional(string) #client-certificate-data
      key_data  = optional(string) #client-key-data
      insecure  = optional(bool)
    }), null)
  }))
  default = {}
}

variable "argocd_application_set" {
  type = map(object({
    repo_url                           = string
    revision                           = optional(string, "main")
    project                            = optional(string, "default")
    directory_path                     = string
    template_metadata_name             = optional(string, "{{path.basename}}")
    source_repo_url                    = string
    source_target_revision             = optional(string, "main")
    source_path                        = string
    value_files_source_repo_url        = string
    value_files_source_ref             = string
    value_files_source_path            = optional(string)
    value_files_source_target_revision = optional(string, "HEAD")
    helm_value_files                   = optional(list(string), [""])
    destination_server                 = string
    destination_namespace              = optional(string)
    sync_options                       = optional(list(string))

    parameter = optional(list(object({
      name  = optional(string, "")
      value = optional(string, "")
    })), [])

    sync_policy_automated = optional(object({
      prune     = optional(bool)
      self_heal = optional(bool)
    }), null)
  }))
  default = {}
}

variable "argocd_application" {
  type = map(object({
    annotations            = optional(map(string))
    labels                 = optional(map(string))
    namespace              = optional(string, "argocd")
    cascade                = optional(bool)
    validate               = optional(bool)
    wait                   = optional(bool)
    revision_history_limit = optional(number)
    timeouts_create        = optional(string)
    timeouts_delete        = optional(string)
    timeouts_update        = optional(string)
    destination_server     = optional(string)
    destination_namespace  = optional(string)
    project                = optional(string, "default")
    sync_options           = optional(list(string))

    source = optional(list(object({
      repo_url        = string
      target_revision = optional(string, "HEAD")
      ref             = optional(string, "")
      chart           = optional(string, "")
      path            = optional(string, ".")

      helm = optional(object({
        value_files = optional(list(string))

        parameter = optional(list(object({
          force_string = optional(bool)
          name         = optional(string)
          value        = optional(string)
        })), [])

        file_parameter = optional(list(object({
          name = optional(string)
          path = optional(string)
        })), [])
      }), null)

      kustomize = optional(object({
        common_annotations = optional(map(string))
        common_labels      = optional(map(string))
        images             = optional(set(string))
        name_prefix        = optional(string)
        name_suffix        = optional(string)
        version            = optional(string)
      }), null)

      directory = optional(object({
        recurse = optional(bool)
        include = optional(string)
        exclude = optional(string)

        jsonnet = optional(object({
          libs = optional(list(string))

          ext_var = optional(list(object({
            code  = optional(bool)
            name  = optional(string)
            value = optional(string)
          })), [])

          tla = optional(list(object({
            code  = optional(bool)
            name  = optional(string)
            value = optional(string)
          })), [])
        }), null)
      }), null)

    })), [])

    value_files_source = optional(list(object({
      repo_url        = string
      target_revision = optional(string, "HEAD")
      ref             = optional(string, "")
      path            = optional(string, ".")
    })), [])

    managed_namespace_metadata = optional(object({
      labels      = optional(map(string))
      annotations = optional(map(string))
    }), null)

    retry = optional(object({
      limit = optional(string)

      backoff = optional(object({
        duration     = optional(string)
        max_duration = optional(string)
        factor       = optional(string)
      }), null)
    }), null)

    info = optional(list(object({
      name  = optional(string, "")
      value = optional(string, "")
    })), [])

    ignore_difference = optional(list(object({
      group                   = optional(string)
      jq_path_expressions     = optional(set(string))
      json_pointers           = optional(set(string))
      kind                    = optional(string)
      managed_fields_managers = optional(set(string))
      name                    = optional(string)
      namespace               = optional(string)
    })), [])

    sync_policy_automated = optional(object({
      prune     = optional(bool)
      self_heal = optional(bool)
    }), null)

  }))
  default = {}
}

variable "argocd_project" {
  type = map(object({
    description       = optional(string)
    source_namespaces = optional(set(string))
    source_repos      = list(string)
    annotations       = optional(map(string))
    labels            = optional(map(string))
    signature_keys    = optional(list(string))
    namespace         = optional(string, "argocd")

    destination = optional(list(object({
      server    = optional(string, "")
      name      = optional(string, "")
      namespace = string
    })), [])

    role = optional(list(object({
      name        = string
      description = optional(string, "")
      policies    = list(string)
      groups      = optional(list(string))
    })), [])

    cluster_resource_blacklist = optional(list(object({
      group = optional(string, "")
      kind  = optional(string, "")
    })), [])

    cluster_resource_whitelist = optional(list(object({
      group = optional(string, "")
      kind  = optional(string, "")
    })), [])

    namespace_resource_blacklist = optional(list(object({
      group = optional(string, "")
      kind  = optional(string, "")
    })), [])

    namespace_resource_whitelist = optional(list(object({
      group = optional(string, "")
      kind  = optional(string, "")
    })), [])

    orphaned_resources = optional(object({
      warn = optional(bool)

      ignore = optional(list(object({
        group = optional(string)
        kind  = optional(string)
        name  = optional(string)
      })), [])
    }), null)

    sync_window = optional(list(object({
      kind         = optional(string)
      applications = optional(list(string))
      clusters     = optional(list(string))
      namespaces   = optional(list(string))
      duration     = optional(string)
      schedule     = optional(string)
      manual_sync  = optional(bool)
      timezone     = optional(string)
    })), [])
  }))
  default = {}
}
