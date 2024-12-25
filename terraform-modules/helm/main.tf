resource "helm_release" "helm-chart" {
  for_each                   = { for key, value in var.helm : key => value }
  name                       = each.key
  namespace                  = each.value.namespace
  create_namespace           = each.value.create_namespace
  chart                      = each.value.chart
  repository                 = each.value.repository
  atomic                     = each.value.atomic
  timeout                    = each.value.timeout
  cleanup_on_fail            = each.value.cleanup_on_fail
  max_history                = each.value.max_history
  dependency_update          = each.value.dependency_update
  description                = each.value.description
  devel                      = each.value.devel
  disable_crd_hooks          = each.value.disable_crd_hooks
  disable_openapi_validation = each.value.disable_openapi_validation
  disable_webhooks           = each.value.disable_webhooks
  force_update               = each.value.force_update
  lint                       = each.value.lint
  keyring                    = each.value.keyring
  pass_credentials           = each.value.pass_credentials
  recreate_pods              = each.value.recreate_pods
  render_subchart_notes      = each.value.render_subchart_notes
  replace                    = each.value.replace
  repository_ca_file         = each.value.repository_ca_file
  repository_cert_file       = each.value.repository_cert_file
  repository_key_file        = each.value.repository_key_file
  repository_password        = each.value.repository_password
  repository_username        = each.value.repository_username
  reset_values               = each.value.reset_values
  reuse_values               = each.value.reuse_values
  skip_crds                  = each.value.skip_crds
  upgrade_install            = each.value.upgrade_install
  verify                     = each.value.verify
  wait                       = each.value.wait
  wait_for_jobs              = each.value.wait_for_jobs

  values = lookup(each.value, "values", "") != "" ? [for v in lookup(each.value, "values", []) : file(v)] : []

  dynamic "postrender" {
    for_each = { for i in each.value.postrender : format("%s-%#v", i.binary_path, i.args) => i }
    content {
      binary_path = postrender.value.binary_path
      args        = postrender.value.args
    }
  }

  dynamic "set" {
    for_each = { for i in each.value.set : format("%s-%s-%s", i.type, i.name, i.value) => i }
    content {
      type  = set.value.type
      name  = set.value.name
      value = set.value.value
    }
  }

  dynamic "set_list" {
    for_each = { for i in each.value.set_list : format("%s-%s", i.name, i.value) => i }
    content {
      name  = set_list.value.name
      value = set_list.value.value
    }
  }

  dynamic "set_sensitive" {
    for_each = { for i in each.value.set_sensitive : format("%s-%s-%s", i.type, i.name, i.value) => i }
    content {
      type  = set_sensitive.value.type
      name  = set_sensitive.value.name
      value = set_sensitive.value.value
    }
  }
}
