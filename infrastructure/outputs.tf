output "s3_bucket_name" {
  description = "Name of the resume s3 bucket"
  value       = aws_s3_bucket.resume.bucket
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID."
  value       = aws_cloudfront_distribution.resume.id
}
output "cloudfront_domain_name" {
  description = "CloudFront distribution domain name"
  value       = aws_cloudfront_distribution.resume.domain_name
}
output "api_url" {
  description = "Base URL for the visitor counter API"
  value       = aws_apigatewayv2_stage.default.invoke_url
}
output "github_actions_role_arn" {
description = "IAM role ARN assumed by Github Actions."
value = aws_iam_role.github_actions.arn
}
