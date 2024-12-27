resource "argocd_application" "application" {
  for_each = { for key, value in var.argocd_application : key => value }

  metadata {
    name        = each.key
    namespace   = each.value.namespace
    labels      = each.value.labels
    annotations = each.value.annotations
  }

  cascade  = each.value.cascade
  validate = each.value.validate
  wait     = each.value.wait

  timeouts {
    create = each.value.timeouts_create
    delete = each.value.timeouts_delete
    update = each.value.timeouts_update
  }

  spec {
    project                = each.value.project
    revision_history_limit = each.value.revision_history_limit

    dynamic "source" {
      for_each = { for i in each.value.source : format("%s-%s-%s-%s-%s", i.ref, i.path, i.repo_url, i.chart, i.target_revision) => i }
      content {
        ref             = source.value.ref
        path            = source.value.path
        repo_url        = source.value.repo_url
        chart           = source.value.chart
        target_revision = source.value.target_revision

        dynamic "helm" {
          for_each = can(source.value.helm) && source.value.helm != null ? [source.value.helm] : []
          content {
            value_files                = try(helm.value.value_files, null)
            ignore_missing_value_files = try(helm.value.ignore_missing_value_files, null)
            pass_credentials           = try(helm.value.pass_credentials, null)
            release_name               = try(helm.value.release_name, null)
            skip_crds                  = try(helm.value.skip_crds, null)
            values                     = try(helm.value.values, null)
            version                    = try(helm.value.version, null)

            dynamic "parameter" {
              for_each = can(helm.value.parameter) && helm.value.parameter != null ? helm.value.parameter : []
              content {
                force_string = try(parameter.value.force_string, null)
                name         = try(parameter.value.name, null)
                value        = try(parameter.value.value, null)
              }
            }

            dynamic "file_parameter" {
              for_each = can(helm.value.file_parameter) && helm.value.file_parameter != null ? helm.value.file_parameter : []
              content {
                name = try(file_parameter.value.name, null)
                path = try(file_parameter.value.path, null)
              }
            }
          }
        }

        dynamic "kustomize" {
          for_each = can(source.value.kustomize) && source.value.kustomize != null ? [source.value.kustomize] : []
          content {
            name_prefix        = try(kustomize.value.name_prefix, null)
            name_suffix        = try(kustomize.value.name_suffix, null)
            version            = try(kustomize.value.version, null)
            common_annotations = try(kustomize.value.common_annotations, null)
            common_labels      = try(kustomize.value.common_labels, null)
            images             = try(kustomize.value.images, null)
          }
        }

        dynamic "plugin" {
          for_each = can(source.value.plugin) && source.value.plugin != null ? [source.value.plugin] : []
          content {
            name = try(plugin.value.name, null)

            dynamic "env" {
              for_each = can(plugin.value.plugin) && plugin.value.plugin != null ? plugin.value.plugin : []
              content {
                name  = try(env.value.name, null)
                value = try(env.value.value, null)
              }
            }
          }

        }

        dynamic "directory" {
          for_each = can(source.value.directory) && source.value.directory != null ? [source.value.directory] : []
          content {
            recurse = try(directory.value.recurse, null)
            include = try(directory.value.include, null)
            exclude = try(directory.value.exclude, null)

            dynamic "jsonnet" {
              for_each = can(directory.value.jsonnet) && directory.value.jsonnet != null ? [directory.value.jsonnet] : []
              content {
                libs = try(jsonnet.value.libs, null)

                dynamic "ext_var" {
                  for_each = can(jsonnet.value.ext_var) && jsonnet.value.ext_var != null ? jsonnet.value.ext_var : []
                  content {
                    code  = try(ext_var.value.code, false)
                    name  = try(ext_var.value.name, null)
                    value = try(ext_var.value.value, null)
                  }
                }

                dynamic "tla" {
                  for_each = can(jsonnet.value.tla) && jsonnet.value.tla != null ? jsonnet.value.tla : []
                  content {
                    code  = try(tla.value.code, false)
                    name  = try(tla.value.name, null)
                    value = try(tla.value.value, null)
                  }
                }
              }
            }
          }
        }
      }
    }

    dynamic "ignore_difference" {
      for_each = { for i in each.value.ignore_difference : format("%s-%#v-%#v-%s-%#v-%s-%s", i.group, i.jq_path_expressions, i.json_pointers, i.kind, i.managed_fields_managers, i.name, i.namespace) => i }
      content {
        group                   = ignore_difference.value.group
        jq_path_expressions     = ignore_difference.value.jq_path_expressions
        json_pointers           = ignore_difference.value.json_pointers
        kind                    = ignore_difference.value.kind
        managed_fields_managers = ignore_difference.value.managed_fields_managers
        name                    = ignore_difference.value.name
        namespace               = ignore_difference.value.namespace
      }
    }

    dynamic "info" {
      for_each = { for i in each.value.info : format("%s-%s", i.name, i.value) => i }
      content {
        name  = info.value.name
        value = info.value.value
      }
    }

    sync_policy {
      dynamic "automated" {
        for_each = can(each.value.sync_policy_automated) && each.value.sync_policy_automated != null ? [each.value.sync_policy_automated] : []
        content {
          prune     = try(automated.value.prune, null)
          self_heal = try(automated.value.self_heal, null)
        }
      }

      dynamic "managed_namespace_metadata" {
        for_each = can(each.value.managed_namespace_metadata) && each.value.managed_namespace_metadata != null ? [each.value.managed_namespace_metadata] : []
        content {
          labels      = try(managed_namespace_metadata.value.labels, null)
          annotations = try(managed_namespace_metadata.value.annotations, null)
        }
      }

      dynamic "retry" {
        for_each = can(each.value.retry) && each.value.retry != null ? [each.value.retry] : []
        content {
          limit = try(retry.value.limit, null)

          dynamic "backoff" {
            for_each = can(retry.value.backoff) && retry.value.backoff != null ? [retry.value.backoff] : []
            content {
              duration     = try(backoff.value.duration, null)
              max_duration = try(backoff.value.max_duration, null)
              factor       = try(backoff.value.factor, null)
            }
          }
        }
      }

      sync_options = each.value.sync_options
    }

    dynamic "source" {
      for_each = { for i in each.value.value_files_source : format("%s-%s-%s-%s", i.repo_url, i.target_revision, i.ref, i.path) => i }
      content {
        repo_url        = source.value.repo_url
        target_revision = source.value.target_revision
        ref             = source.value.ref
        path            = source.value.path
      }
    }

    destination {
      server    = each.value.destination_server
      namespace = each.value.destination_namespace
    }
  }
}
