resource "aws_iam_role" "mackerel_integration" {
  name               = "mackerel-aws-integration"
  assume_role_policy = data.aws_iam_policy_document.mackerel_integration_role.json
}

data "aws_iam_policy_document" "mackerel_integration_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::217452466226:root"]
    }
    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values   = [local.aws_integration_iam_role_external_id_org_a]
    }
  }
}

resource "aws_iam_role_policy" "mackerel_integration" {
  name   = "mackerel-integration-policy"
  role   = aws_iam_role.mackerel_integration.id
  policy = data.aws_iam_policy_document.mackerel_integration.json
}

// ref: https://mackerel.io/ja/docs/entry/integrations/aws
data "aws_iam_policy_document" "mackerel_integration" {
  statement {
    actions = [
      "lambda:GetFunctionConfiguration",
      "lambda:List*",
      "budgets:ViewBudget",
      "cloudwatch:Get*",
      "cloudwatch:List*",
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
      "s3:GetBucketLogging",
      "s3:GetBucketTagging",
      "s3:GetEncryptionConfiguration",
      "s3:GetMetricsConfiguration"
    ]
    resources = ["*"]
  }
}
