resource "mackerel_alert_group_setting" "admin" {
  name = "admin"
  memo = "For Admin members"
  service_scopes = [
    mackerel_service.dev.name,
  ]
  depends_on = [
    mackerel_service.dev
  ]
}
