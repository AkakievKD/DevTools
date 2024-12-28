resource "harbor_registry" "registry" {
  for_each      = { for key, value in var.harbor_registry : key => value }
  provider_name = each.value.provider_name
  name          = each.key
  endpoint_url  = each.value.endpoint_url
  access_id     = each.value.access_id
  access_secret = each.value.access_secret
  description   = each.value.description
  insecure      = each.value.insecure
}
