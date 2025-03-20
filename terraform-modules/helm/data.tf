data "helm_template" "helm-chart-template" {
  for_each                   = { for key, value in var.helm_template : key => value }
  chart                      = each.value.chart
  name                       = each.key
  api_versions               = each.value.api_versions
  atomic                     = each.value.atomic
  crds                       = each.value.crds
  create_namespace           = each.value.create_namespace
  dependency_update          = each.value.dependency_update
  description                = each.value.description
  devel                      = each.value.devel
  disable_openapi_validation = each.value.disable_openapi_validation
  disable_webhooks           = each.value.disable_webhooks
  include_crds               = each.value.include_crds
  is_upgrade                 = each.value.is_upgrade
  keyring                    = each.value.keyring
  kube_version               = each.value.kube_version
  manifest                   = each.value.manifest
  manifests                  = each.value.manifest
  namespace                  = each.value.namespace
  notes                      = each.value.notes
  pass_credentials           = each.value.pass_credentials
  show_only                  = each.value.show_only
  skip_crds                  = each.value.skip_crds
  skip_tests                 = each.value.skip_tests
  timeout                    = each.value.timeout
  validate                   = each.value.validate
  verify                     = each.value.verify
  version                    = each.value.version
  wait                       = each.value.wait
  render_subchart_notes      = each.value.render_subchart_notes
  replace                    = each.value.replace
  repository                 = each.value.repository
  repository_ca_file         = each.value.repository_ca_file
  repository_cert_file       = each.value.repository_cert_file
  repository_key_file        = each.value.repository_key_file
  repository_password        = each.value.repository_password
  repository_username        = each.value.repository_username
  reset_values               = each.value.reset_values
  reuse_values               = each.value.reuse_values

  values = lookup(each.value, "values", "") != "" ? [for v in lookup(each.value, "values", []) : file(v)] : []

  dynamic "postrender" {
    for_each = each.value.postrender
    content {
      binary_path = postrender.value.binary_path
    }
  }

  dynamic "set" {
    for_each = each.value.set
    content {
      type  = set.value.type
      name  = set.value.name
      value = set.value.value
    }
  }

  dynamic "set_list" {
    for_each = each.value.set_list
    content {
      name  = set_list.value.name
      value = set_list.value.value
    }
  }

  dynamic "set_sensitive" {
    for_each = each.value.set_sensitive
    content {
      type  = set_sensitive.value.type
      name  = set_sensitive.value.name
      value = set_sensitive.value.value
    }
  }
}
