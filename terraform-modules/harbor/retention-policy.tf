resource "harbor_retention_policy" "retention_policy" {
  for_each = { for key, value in var.harbor_retention_policy : key => value }
  scope    = each.value.scope
  schedule = each.value.schedule

  dynamic "rule" {
    for_each = { for i in each.value.filters : format("%t-%t-%g-%g-%g-%g-%s-%s-%s-%s-%t", i.always_retain, i.disabled, i.most_recently_pulled, i.most_recently_pushed, i.n_days_since_last_pull, i.n_days_since_last_push, i.repo_excluding, i.repo_matching, i.tag_excluding, i.tag_matching, i.untagged_artifacts) => i }
    content {
      always_retain          = rule.value.always_retain
      disabled               = rule.value.disabled
      most_recently_pulled   = rule.value.most_recently_pulled
      most_recently_pushed   = rule.value.most_recently_pushed
      n_days_since_last_pull = rule.value.n_days_since_last_pull
      n_days_since_last_push = rule.value.n_days_since_last_push
      repo_excluding         = rule.value.repo_excluding
      repo_matching          = rule.value.repo_matching
      tag_excluding          = rule.value.tag_excluding
      tag_matching           = rule.value.tag_matching
      untagged_artifacts     = rule.value.untagged_artifacts
    }
  }
}
