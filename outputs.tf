output "id" {
  value = "${aws_vpc.vpc.id}"
}

output "public_route_table_id" {
  value = "${aws_vpc.vpc.main_route_table_id}"
}

output "zone_id" {
  value = "${aws_route53_zone.route53_zone.zone_id}"
}

output "default_sg_id" {
  value = "${aws_vpc.vpc.default_security_group_id}"
}

output "pvt_route_table_aza_id" {
  value = "${module.pvt_route_table_aza.route_table_id}"
}

output "pvt_route_table_azb_id" {
  value = "${module.pvt_route_table_azb.route_table_id}"
}

output "security_group" {
  value = "${module.web-security-group.id}"
}
