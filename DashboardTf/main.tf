resource "newrelic_one_dashboard" "lavishdash" {
  name        = "LavishTf_Dashboard"
  permissions = "public_read_only"

  page {
    name = "Lavish Page"

    widget_billboard {
      title  = "Requests per minute"
      row    = 1
      column = 1
      width  = 6
      height = 3

      nrql_query {
        query = "SELECT count(*) FROM Metric"
      }
    }

    widget_bar {
      title  = "Visualize the count of errors per service for a specified duration"
      row    = 1
      column = 7
      width  = 6
      height = 3

      nrql_query {
        account_id = 4267261
        query      = "SELECT count(*) FROM TransactionError FACET error.serviceName SINCE 7 days ago"
      }

    }

    widget_bar {
      title  = "Display the average response times for different transaction types"
      row    = 4
      column = 1
      width  = 6
      height = 3

      nrql_query {
        account_id = 4267261
        query      = "SELECT average(duration) FROM Transaction FACET transactionType SINCE 3 days ago"
      }

      filter_current_dashboard = true

      colors {
        color = "#722727"
        series_overrides {
          color = "#722322"
          series_name = "Node"
        }
        series_overrides {
          color = "#236f70"
          series_name = "Java"
        }
      }
    }

    widget_line {
      title  = "Average transaction duration and the request per minute, by application"
      row    = 4
      column = 7
      width  = 6
      height = 3

      nrql_query {
        account_id = 4267261
        query      = "FROM Transaction select max(duration) as 'max duration' where httpResponseCode = '504' timeseries since 5 minutes ago"
      }

      nrql_query {
        query = "FROM Transaction SELECT rate(count(*), 1 minute)"
      }
      legend_enabled = true
      ignore_time_range = false
      y_axis_left_zero = true
      y_axis_left_min = 0
      y_axis_left_max = 1

      units {
        unit = "ms"
        series_overrides {
          unit = "ms"
          series_name = "max duration"
        }
      }
    }
  }
}