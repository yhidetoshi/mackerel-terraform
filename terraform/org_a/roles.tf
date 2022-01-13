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

resource "mackerel_role" "lambda" {
  name    = "lambda"
  service = mackerel_service.aws.name
  depends_on = [
    mackerel_service.aws
  ]
}
resource "mackerel_role" "s3" {
  name    = "s3"
  service = mackerel_service.aws.name
  depends_on = [
    mackerel_service.aws
  ]
}

resource "mackerel_role" "billing" {
  name    = "billing"
  service = mackerel_service.aws.name
  depends_on = [
    mackerel_service.aws
  ]
}
