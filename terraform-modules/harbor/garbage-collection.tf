resource "harbor_garbage_collection" "garbage_collection" {
  for_each        = { for key, value in var.harbor_garbage_collection : key => value }
  schedule        = each.value.schedule
  delete_untagged = each.value.delete_untagged
  workers         = each.value.workers
}
