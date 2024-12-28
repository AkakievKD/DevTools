resource "harbor_replication" "replication" {
  for_each               = { for key, value in var.harbor_replication : key => value }
  name                   = each.key
  action                 = each.value.action
  registry_id            = each.value.registry_id
  schedule               = each.value.schedule
  deletion               = each.value.deletion
  description            = each.value.description
  dest_namespace         = each.value.dest_namespace
  dest_namespace_replace = each.value.dest_namespace_replace
  copy_by_chunk          = each.value.copy_by_chunk
  enabled                = each.value.enabled
  execute_on_changed     = each.value.execute_on_changed
  override               = each.value.override
  speed                  = each.value.speed

  dynamic "filters" {
    for_each = { for i in each.value.filters : format("%s-%s-%#v-%s-%s", i.name, i.decoration, i.labels, i.resource, i.tag) => i }
    content {
      name       = filters.value.name
      decoration = filters.value.decoration
      labels     = filters.value.labels
      resource   = filters.value.resource
      tag        = filters.value.tag
    }
  }
}
