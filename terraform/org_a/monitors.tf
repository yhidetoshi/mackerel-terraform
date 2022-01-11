resource "mackerel_monitor" "cpu_high" {
  name    = "VM CPU %"
  is_mute = false

  host_metric {
    metric   = "cpu%"
    operator = ">"
    warning  = 80
    critical = 90
    duration = 3

    scopes = ["dev:web"]
  }
}
