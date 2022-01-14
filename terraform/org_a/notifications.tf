resource "mackerel_channel" "email" {
  name = "Email"

  email {
    emails = ["sample1@example.com", "sample2@example.com"]
    events = ["alert", "alertGroup"]
  }
}

resource "mackerel_channel" "slack" {
  name = "Slack"

  slack {
    url                 = "https://hooks.slack.com/services/xxx/yyy/zzz"
    enabled_graph_image = true
    events              = ["alert", "alertGroup"]
    mentions = {
      critical = "@here"
    }
  }
}
