module "vpc" {
  source = "github.com/terraform-community-modules/tf_aws_vpc"

  name = "MCOM-DEV"

  cidr = "10.222.128.0/18"
  private_subnets = ["10.222.132.0/22", "10.222.140.0/22", "10.222.148.0/22", "10.222.156.0/22" ]
  public_subnets  = ["10.222.128.0/22","10.222.136.0/22", "10.222.144.0/22", "10.222.152.0/22" ]
  private_propagating_vgws = ["vgw-b9927bd0"]
  public_propagating_vgws = ["vgw-b9927bd0"]

  enable_nat_gateway = "true"
  enable_dns_hostnames = "true"
  enable_dns_support = "true"

  azs      = ["us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e"]
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "private_subnets" {
  value = "${module.vpc.private_subnets}"
}

output "public_subnets" {
  value = "${module.vpc.public_subnets}"
}

output "public_route_table_ids" {
  value = "${module.vpc.public_route_table_ids}"
}

output "private_route_table_ids" {
  value = "${module.vpc.private_route_table_ids}"
}
