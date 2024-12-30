resource "minio_iam_group" "iam_group" {
  for_each      = { for key in var.minio_iam_group : key.name => key }
  name          = each.value.name
  disable_group = each.value.disable_group
  force_destroy = each.value.force_destroy
}
