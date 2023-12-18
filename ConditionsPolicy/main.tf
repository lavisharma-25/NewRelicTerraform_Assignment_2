resource "newrelic_alert_policy" "example_policy" {
  name = "lavish-policy"
}

resource "newrelic_nrql_alert_condition" "example_conditions" {
  count = length(var.alert_conditions)

  account_id = 4267261
  policy_id  = newrelic_alert_policy.example_policy.id

  type         = "static"
  name         = var.alert_conditions[count.index].name
  description  = var.alert_conditions[count.index].description
  runbook_url  = var.alert_conditions[count.index].runbook_url
  enabled      = true

  nrql {
    query = var.alert_conditions[count.index].query
  }

  critical {
    operator              = var.alert_conditions[count.index].critical_threshold.operator
    threshold             = var.alert_conditions[count.index].critical_threshold.threshold
    threshold_duration    = var.alert_conditions[count.index].critical_threshold.threshold_duration
    threshold_occurrences = var.alert_conditions[count.index].critical_threshold.threshold_occurrences
  }

  warning {
    operator              = var.alert_conditions[count.index].warning_threshold.operator
    threshold             = var.alert_conditions[count.index].warning_threshold.threshold
    threshold_duration    = var.alert_conditions[count.index].warning_threshold.threshold_duration
    threshold_occurrences = var.alert_conditions[count.index].warning_threshold.threshold_occurrences
  }
}
