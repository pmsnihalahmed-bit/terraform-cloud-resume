resource "aws_route53_zone" "resume" {
  name = var.domain_name
}

output "route53_name_servers" {
  description = "Name servers assigned to the Route 53 hosted zone."
  value       = aws_route53_zone.resume.name_servers
}

resource "aws_route53_record" "cloudfront" {
  zone_id = aws_route53_zone.resume.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.resume.domain_name
    zone_id                = aws_cloudfront_distribution.resume.hosted_zone_id
    evaluate_target_health = false
  }
}
