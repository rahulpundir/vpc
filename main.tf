resource "aws_vpc" "vpc" {
  cidr_block           = "${var.cidr}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  enable_dns_support   = "${var.enable_dns_support}"

  tags {
    Name = "${var.name}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "${var.name}-igw"
  }
}

resource "aws_route" "public_internet_gateway" {
  route_table_id         = "${aws_vpc.vpc.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.igw.id}"
}

resource "aws_route53_zone" "route53_zone" {
  name   = "${var.route53_zone_name}"
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "${var.route53_zone_name}"
  }
}

module "pub_sn_a" {
  source                  = "github.com/opstree-terraform/subnet"
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr                    = "${var.pub_sn_aza_cidr}"
  az                      = "${var.region}a"
  name                    = "${var.pub_sn_aza_name}"
  map_public_ip_on_launch = "false"
}

module "pub_sn_b" {
  source                  = "github.com/opstree-terraform/subnet"
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr                    = "${var.pub_sn_azb_cidr}"
  az                      = "${var.region}b"
  name                    = "${var.pub_sn_azb_name}"
  map_public_ip_on_launch = "false"
}

module "pvt_sn_a" {
  source = "github.com/opstree-terraform/subnet"
  vpc_id = "${aws_vpc.vpc.id}"
  cidr   = "${var.pvt_sn_aza_cidr}"
  az     = "${var.region}a"
  name   = "${var.pvt_sn_aza_name}"
}

module "pvt_sn_b" {
  source = "github.com/opstree-terraform/subnet"
  vpc_id = "${aws_vpc.vpc.id}"
  cidr   = "${var.pvt_sn_azb_cidr}"
  az     = "${var.region}b"
  name   = "${var.pvt_sn_azb_name}"
}

module "pvt_route_table_aza" {
  source    = "github.com/opstree-terraform/pvt_route_table"
  vpc_id    = "${aws_vpc.vpc.id}"
  pub_sn_id = "${module.pub_sn_a.id}"
  vpc_name  = "${var.name}"
}

module "pvt_route_table_azb" {
  source    = "github.com/opstree-terraform/pvt_route_table"
  vpc_id    = "${aws_vpc.vpc.id}"
  pub_sn_id = "${module.pub_sn_b.id}"
  vpc_name  = "${var.name}"
}
