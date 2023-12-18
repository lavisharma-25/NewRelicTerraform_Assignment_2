variable "alert_conditions" {
  description = "List of alert conditions"
  default = [
    {
      name                  = "Condition1"
      description           = "First alert condition"
      runbook_url           = "https://www.example.com/runbook1"
      violation_time_limit_seconds = 3600
      fill_option           = "static"
      fill_value            = 1.0
      aggregation_window    = 60
      aggregation_method    = "event_flow"
      aggregation_delay     = 120
      expiration_duration   = 120
      open_violation_on_expiration = true
      close_violations_on_expiration = true
      slide_by              = 30
      query                 = "SELECT max(cpuIdlePercent) FROM SystemSample"

      critical_threshold    = {
        operator              = "above"
        threshold             = 100
        threshold_duration    = 300
        threshold_occurrences = "ALL"
      }
      warning_threshold     = {
        operator              = "above"
        threshold             = 99
        threshold_duration    = 600
        threshold_occurrences = "ALL"
      }
    },
    {
      name                  = "Condition2"
      description           = "Second alert condition"
      runbook_url           = "https://www.example.com/runbook2"
      violation_time_limit_seconds = 1800
      fill_option           = "static"
      fill_value            = 1.0
      aggregation_window    = 120
      aggregation_method    = "basic"
      aggregation_delay     = 180
      expiration_duration   = 180
      open_violation_on_expiration = true
      close_violations_on_expiration = true
      slide_by              = 60
      query                 = "SELECT average(host.loadAverageOneMinute) FROM Metric"
      critical_threshold    = {
        operator              = "above"
        threshold             = 6
        threshold_duration    = 600
        threshold_occurrences = "ALL"
      }
      warning_threshold     = {
        operator              = "above"
        threshold             = 4.5
        threshold_duration    = 900
        threshold_occurrences = "ALL"
      }
    }
  ]
}