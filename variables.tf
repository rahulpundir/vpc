variable "name" {
  description = "Name of the VPC to be created"
}

variable "cidr" {
  description = "CIDR of VPC"
}

variable "enable_dns_hostnames" {
  default = "true"
}

variable "enable_dns_support" {
  default = "true"
}

variable "route53_zone_name" {
  default = "internal.sandy.com"
}

variable "pub_sn_aza_cidr" {
  description = "CIDR for Public subnet in AZA"
}

variable "pub_sn_azb_cidr" {
  description = "CIDR for Public subnet in AZB"
}

variable "region" {
  description = "Region in which services will be managed"
}

variable "pub_sn_aza_name" {
  description = "Name of Public Subnet in AZA"
}

variable "pub_sn_azb_name" {
  description = "Name of Public Subnet in AZB"
}
