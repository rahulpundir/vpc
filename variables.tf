variable "aws_region" {
  description = "AWS Region in which you want to launch vpc"
  default = "us-east-1"
}
variable "name" {
  default     = "test-vpc"
  description = "Name tag for the VPC to be created"
}

variable "cidr" {
  default = "10.31.0.0/16"
}

variable "enable_dns_hostnames" {
  default = "true"
}

variable "enable_dns_support" {
  default = "true"
}

variable "route53_zone_name" {
  default = "internal.test.com"
}
