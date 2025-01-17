resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "www.${var.domain_name}"
  type    = "A"
  alias {
    name                   = aws_cloudfront_distribution.cdn_static_site.domain_name
    zone_id                = aws_cloudfront_distribution.cdn_static_site.hosted_zone_id
    evaluate_target_health = false
  }
}
output "debug" {
  value = aws_route53_record.www
}

# resource "aws_route53_record" "apex" {
#   zone_id = data.aws_route53_zone.zone.id
#   name    = var.domain_name
#   type    = "A"

#   alias {
#     name                   = aws_cloudfront_distribution.cdn_static_site.domain_name
#     zone_id                = aws_cloudfront_distribution.cdn_static_site.hosted_zone_id
#     evaluate_target_health = false
#   }
# }




# resource "aws_route53_zone" "main" {
#   name = var.domain_name
# }

# resource "aws_route53_record" "root" {
#   zone_id = aws_route53_zone.main.zone_id
#   name    = var.domain_name
#   type    = "A"

#   alias {
#     name                   = aws_cloudfront_distribution.root_distribution.domain_name
#     zone_id                = aws_cloudfront_distribution.root_distribution.hosted_zone_id
#     evaluate_target_health = false
#   }
# }

# resource "aws_route53_record" "www" {
#   zone_id = aws_route53_zone.main.zone_id
#   name    = "www.${var.domain_name}"
#   type    = "A"

#   alias {
#     name                   = aws_cloudfront_distribution.www_distribution.domain_name
#     zone_id                = aws_cloudfront_distribution.www_distribution.hosted_zone_id
#     evaluate_target_health = false
#   }
# }
