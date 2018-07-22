# vpc
Terraform module to manage VPC, this module is built on golden principle of "Convention over Configuration". In our experience a VPC module would be lot more powerful if it comes loaded will couple of AWS resources, as anyways you would be adding these resources in your VPC later on. So why not have those AWS resources already available via our VPC module. List of aws resources with which our VPC module will come bundled with:
* [] Internet Gateway
* [] Route for internet gateway
* [] Internal route53 zone so that instances can interact with each other using domain names instead of IP.
* [] Public subnets in availability zone A & B
* [] Private subnets in availability zone A & B
* [] Private route table for availabilit zone A & B
 
