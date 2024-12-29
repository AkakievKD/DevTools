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
      for_each = can(each.value.destination) && each.value.destination != null ? each.value.destination : []
      content {
        server    = destination.value.server
        name      = destination.value.name
        namespace = destination.value.namespace
      }
    }

    dynamic "cluster_resource_blacklist" {
      for_each = can(each.value.cluster_resource_blacklist) && each.value.cluster_resource_blacklist != null ? each.value.cluster_resource_blacklist : []
      content {
        group = cluster_resource_blacklist.value.group
        kind  = cluster_resource_blacklist.value.kind
      }
    }

    dynamic "cluster_resource_whitelist" {
      for_each = can(each.value.cluster_resource_whitelist) && each.value.cluster_resource_whitelist != null ? each.value.cluster_resource_whitelist : []
      content {
        group = cluster_resource_whitelist.value.group
        kind  = cluster_resource_whitelist.value.kind
      }
    }

    dynamic "namespace_resource_blacklist" {
      for_each = can(each.value.namespace_resource_blacklist) && each.value.namespace_resource_blacklist != null ? each.value.namespace_resource_blacklist : []
      content {
        group = namespace_resource_blacklist.value.group
        kind  = namespace_resource_blacklist.value.kind
      }
    }

    dynamic "namespace_resource_whitelist" {
      for_each = can(each.value.namespace_resource_whitelist) && each.value.namespace_resource_whitelist != null ? each.value.namespace_resource_whitelist : []
      content {
        group = namespace_resource_whitelist.value.group
        kind  = namespace_resource_whitelist.value.kind
      }
    }

    dynamic "orphaned_resources" {
      for_each = can(each.value.orphaned_resources) && each.value.orphaned_resources != null ? [each.value.orphaned_resources] : []
      content {
        warn = orphaned_resources.value.warn

        dynamic "ignore" {
          for_each = can(orphaned_resources.value.ignore) && orphaned_resources.value.ignore != null ? orphaned_resources.value.ignore : []
          content {
            group = ignore.value.group
            kind  = ignore.value.kind
            name  = ignore.value.name
          }
        }
      }
    }

    dynamic "role" {
      for_each = can(each.value.role) && each.value.role != null ? each.value.role : []
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
        kind         = sync_window.value.kind
        applications = sync_window.value.applications
        clusters     = sync_window.value.clusters
        namespaces   = sync_window.value.namespaces
        duration     = sync_window.value.duration
        schedule     = sync_window.value.schedule
        manual_sync  = sync_window.value.manual_sync
        timezone     = sync_window.value.timezone
      }
    }
  }
}
