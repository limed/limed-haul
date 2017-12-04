# Create a delegation set so that we can reuse the same NS for a
# multiple hosted zones
resource "aws_route53_delegation_set" "haul-delegation" {
  lifecycle {
    create_before_destroy = true
  }

  reference_name = "${var.service_name}"
}

variable my_dns_zone {
  type  = "map"

  default = {
    stage = "limed.me"
    prod  = "sudoers.xyz"
  }
}
module "sudoers_xyz" {
  source                  = "dns"
  region                  = "${var.region}"
  environment             = "${var.environment}"
  service_name            = "${var.service_name}"

  zone_name               = "${lookup(var.my_dns_zone, var.environment)}"
  route53_delegation_set  = "${aws_route53_delegation_set.haul-delegation.id}"
  elb_address             = "${module.load_balancer_web.address}"
}
