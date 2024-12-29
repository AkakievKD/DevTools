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
      for_each = can(each.value.source) && each.value.source != null ? [each.value.source] : []
      content {
        repo_url        = source.value.repo_url
        ref             = source.value.ref
        path            = source.value.path
        chart           = source.value.chart
        target_revision = source.value.target_revision

        dynamic "helm" {
          for_each = can(source.value.helm) && source.value.helm != null ? [source.value.helm] : []
          content {
            value_files                = helm.value.value_files
            ignore_missing_value_files = helm.value.ignore_missing_value_files
            pass_credentials           = helm.value.pass_credentials
            release_name               = helm.value.release_name
            skip_crds                  = helm.value.skip_crds
            values                     = helm.value.values
            version                    = helm.value.version

            dynamic "parameter" {
              for_each = can(helm.value.parameter) && helm.value.parameter != null ? helm.value.parameter : []
              content {
                force_string = parameter.value.force_string
                name         = parameter.value.name
                value        = parameter.value.value
              }
            }

            dynamic "file_parameter" {
              for_each = can(helm.value.file_parameter) && helm.value.file_parameter != null ? helm.value.file_parameter : []
              content {
                name = file_parameter.value.name
                path = file_parameter.value.path
              }
            }
          }
        }

        dynamic "kustomize" {
          for_each = can(source.value.kustomize) && source.value.kustomize != null ? [source.value.kustomize] : []
          content {
            name_prefix        = kustomize.value.name_prefix
            name_suffix        = kustomize.value.name_suffix
            version            = kustomize.value.version
            common_annotations = kustomize.value.common_annotations
            common_labels      = kustomize.value.common_labels
            images             = kustomize.value.images
          }
        }

        dynamic "plugin" {
          for_each = can(source.value.plugin) && source.value.plugin != null ? [source.value.plugin] : []
          content {
            name = plugin.value.name

            dynamic "env" {
              for_each = can(plugin.value.plugin) && plugin.value.plugin != null ? plugin.value.plugin : []
              content {
                name  = env.value.name
                value = env.value.value
              }
            }
          }
        }

        dynamic "directory" {
          for_each = can(source.value.directory) && source.value.directory != null ? [source.value.directory] : []
          content {
            recurse = directory.value.recurse
            include = directory.value.include
            exclude = directory.value.exclude

            dynamic "jsonnet" {
              for_each = can(directory.value.jsonnet) && directory.value.jsonnet != null ? [directory.value.jsonnet] : []
              content {
                libs = jsonnet.value.libs

                dynamic "ext_var" {
                  for_each = can(jsonnet.value.ext_var) && jsonnet.value.ext_var != null ? jsonnet.value.ext_var : []
                  content {
                    code  = ext_var.value.code
                    name  = ext_var.value.name
                    value = ext_var.value.value
                  }
                }

                dynamic "tla" {
                  for_each = can(jsonnet.value.tla) && jsonnet.value.tla != null ? jsonnet.value.tla : []
                  content {
                    code  = tla.value.code
                    name  = tla.value.name
                    value = tla.value.value
                  }
                }
              }
            }
          }
        }
      }
    }

    dynamic "ignore_difference" {
      for_each = can(each.value.ignore_difference) && each.value.ignore_difference != null ? each.value.ignore_difference : []
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
      for_each = can(each.value.info) && each.value.info != null ? each.value.info : []
      content {
        name  = info.value.name
        value = info.value.value
      }
    }

    sync_policy {
      dynamic "automated" {
        for_each = can(each.value.sync_policy_automated) && each.value.sync_policy_automated != null ? [each.value.sync_policy_automated] : []
        content {
          prune     = automated.value.prune
          self_heal = automated.value.self_heal
        }
      }

      dynamic "managed_namespace_metadata" {
        for_each = can(each.value.managed_namespace_metadata) && each.value.managed_namespace_metadata != null ? [each.value.managed_namespace_metadata] : []
        content {
          labels      = managed_namespace_metadata.value.labels
          annotations = managed_namespace_metadata.value.annotations
        }
      }

      dynamic "retry" {
        for_each = can(each.value.retry) && each.value.retry != null ? [each.value.retry] : []
        content {
          limit = retry.value.limit

          dynamic "backoff" {
            for_each = can(retry.value.backoff) && retry.value.backoff != null ? [retry.value.backoff] : []
            content {
              duration     = backoff.value.duration
              max_duration = backoff.value.max_duration
              factor       = backoff.value.factor
            }
          }
        }
      }

      sync_options = each.value.sync_options
    }

    dynamic "source" {
      for_each = can(each.value.value_files_source) && each.value.value_files_source != null ? each.value.value_files_source : []
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
