output "aws_integration_iam_role_arn" {
  value = aws_iam_role.mackerel_integration.arn
}

output "aws_integration_iam_role_external_id_org_a" {
  value     = local.aws_integration_iam_role_external_id_org_a
  sensitive = true
}
