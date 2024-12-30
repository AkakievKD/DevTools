resource "minio_s3_bucket_versioning" "s3_bucket_versioning" {
  for_each = { for key in var.minio_s3_bucket_versioning : key.bucket => key }
  bucket   = each.value.bucket

  dynamic "versioning_configuration" {
    for_each = can(each.value.versioning_configuration) && each.value.versioning_configuration != null ? each.value.versioning_configuration : []
    content {
      status            = versioning_configuration.value.status
      exclude_folders   = versioning_configuration.value.exclude_folders
      excluded_prefixes = versioning_configuration.value.excluded_prefixes
    }
  }
}
