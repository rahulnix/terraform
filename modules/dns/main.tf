

resource "aws_route53_zone" "private" {
  name = "infrasalvus.com"

  vpc {
    vpc_id =  var.vpc_id 
  }
}

resource "aws_route53_record" "www" {
  zone_id =  aws_route53_zone.private.zone_id 
  name    = "www.infrasalvus.com"
  type    = "CNAME"
  ttl     = "300"
  records = [ var.public_ip_id ]
}
