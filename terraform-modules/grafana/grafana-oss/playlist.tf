resource "grafana_playlist" "playlist" {
  for_each = { for key, value in var.grafana_playlist : key => value }

  name     = each.key
  interval = each.value.interval
  org_id   = each.value.org_id

  dynamic "item" {
    for_each = each.value.item
    content {
      order = item.value.order
      title = item.value.title
      type  = item.value.type
      value = item.value.value
    }
  }
}
