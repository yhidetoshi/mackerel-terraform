resource "mackerel_service" "aws" {
  name = "AWS"
  memo = "aws billing"
}

resource "mackerel_service" "dev" {
  name = "dev"
}
