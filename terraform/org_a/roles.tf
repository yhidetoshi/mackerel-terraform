# web
resource "mackerel_role" "web" {
  name    = "web"
  service = mackerel_service.dev.name
  depends_on = [
    mackerel_service.dev
  ]
}

resource "mackerel_role" "db" {
  name    = "db"
  service = mackerel_service.dev.name
  depends_on = [
    mackerel_service.dev
  ]
}
