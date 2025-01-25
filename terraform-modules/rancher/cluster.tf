resource "rancher2_cluster" "cluster" {
  for_each = { for key in var.rancher2_cluster : key.name => key }
  
  name     = each.value.name
}
