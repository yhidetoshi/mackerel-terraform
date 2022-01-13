resource "mackerel_aws_integration" "us_east_1" {
  name          = "us-east-1"
  memo          = "monitor for us-east-1"
  key           = ""
  secret_key    = ""
  role_arn      = data.terraform_remote_state.aws.outputs.aws_integration_iam_role_arn
  external_id   = data.terraform_remote_state.aws.outputs.aws_integration_iam_role_external_id_org_a
  region        = "us-east-1"
  included_tags = "" # ex) = "Name:hoge,Environment:dev"
  excluded_tags = ""

  ec2 {
    enable               = false
    role                 = "${mackerel_service.dev.name}: ${mackerel_role.web.name}"
    excluded_metrics     = []
    retire_automatically = true
  }

  lambda {
    enable = true
    role   = "${mackerel_service.aws.name}: ${mackerel_role.lambda.name}"
  }

  s3 {
    enable = false
    role   = "${mackerel_service.aws.name}: ${mackerel_role.s3.name}"
  }

  billing {
    enable = true
    role   = "${mackerel_service.aws.name}: ${mackerel_role.billing.name}"
  }
}


resource "mackerel_aws_integration" "ap_northeast_1" {
  name          = "ap-northeast-1"
  memo          = "monitor for ap-northeast-1"
  role_arn      = data.terraform_remote_state.aws.outputs.aws_integration_iam_role_arn
  external_id   = data.terraform_remote_state.aws.outputs.aws_integration_iam_role_external_id_org_a
  region        = "ap-northeast-1"
  included_tags = "" # ex) = "Name:hoge,Environment:dev"
  excluded_tags = ""

  ec2 {
    enable               = false
    role                 = "${mackerel_service.dev.name}: ${mackerel_role.web.name}"
    excluded_metrics     = []
    retire_automatically = true
  }
}
