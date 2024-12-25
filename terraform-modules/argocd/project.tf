resource "argocd_project" "project" {
  for_each = { for key, value in var.argocd_project : key => value }
  metadata {
    name        = each.key
    namespace   = each.value.namespace
    annotations = each.value.annotations
    labels      = each.value.labels
  }

  spec {
    description       = each.value.description
    source_namespaces = each.value.source_namespaces
    source_repos      = each.value.source_repos
    signature_keys    = each.value.signature_keys

    dynamic "destination" {
      for_each = { for i in each.value.destination : format("%s-%s-%s", i.server, i.name, i.namespace) => i }
      content {
        server    = destination.value.server
        name      = destination.value.name
        namespace = destination.value.namespace
      }
    }

    dynamic "cluster_resource_blacklist" {
      for_each = { for i in each.value.cluster_resource_blacklist : format("%s-%s", i.group, i.kind) => i }
      content {
        group = cluster_resource_blacklist.value.group
        kind  = cluster_resource_blacklist.value.kind
      }
    }

    dynamic "cluster_resource_whitelist" {
      for_each = { for i in each.value.cluster_resource_whitelist : format("%s-%s", i.group, i.kind) => i }
      content {
        group = cluster_resource_whitelist.value.group
        kind  = cluster_resource_whitelist.value.kind
      }
    }

    dynamic "namespace_resource_blacklist" {
      for_each = { for i in each.value.namespace_resource_blacklist : format("%s-%s", i.group, i.kind) => i }
      content {
        group = namespace_resource_blacklist.value.group
        kind  = namespace_resource_blacklist.value.kind
      }
    }

    dynamic "namespace_resource_whitelist" {
      for_each = { for i in each.value.namespace_resource_whitelist : format("%s-%s", i.group, i.kind) => i }
      content {
        group = namespace_resource_whitelist.value.group
        kind  = namespace_resource_whitelist.value.kind
      }
    }

    dynamic "orphaned_resources" {
      for_each = can(each.value.orphaned_resources) && each.value.orphaned_resources != null ? [each.value.orphaned_resources] : []
      content {
        warn = try(orphaned_resources.value.warn, null)

        dynamic "ignore" {
          for_each = can(orphaned_resources.value.ignore) && orphaned_resources.value.ignore != null ? orphaned_resources.value.ignore : []
          content {
            group = try(ignore.value.group, null)
            kind  = try(ignore.value.kind, null)
            name  = try(ignore.value.name, null)
          }
        }
      }
    }

    dynamic "role" {
      for_each = { for i in each.value.role : format("%s-%s-%#v-%#v", i.name, i.description, i.policies, i.groups) => i }
      content {
        name        = role.value.name
        description = role.value.description
        policies    = role.value.policies
        groups      = role.value.groups
      }
    }

    dynamic "sync_window" {
      for_each = can(each.value.sync_window) && each.value.sync_window != null ? each.value.sync_window : []
      content {
        kind         = try(sync_window.value.kind, null)
        applications = try(sync_window.value.applications, null)
        clusters     = try(sync_window.value.clusters, null)
        namespaces   = try(sync_window.value.namespaces, null)
        duration     = try(sync_window.value.duration, null)
        schedule     = try(sync_window.value.schedule, null)
        manual_sync  = try(sync_window.value.manual_sync, null)
        timezone     = try(sync_window.value.timezone, null)
      }
    }
  }
}
