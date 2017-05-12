module "vpc" {
  source = "github.com/terraform-community-modules/tf_aws_vpc"

  name = "MCOM-PROD"

  cidr = "10.222.0.0/18"
  private_subnets = ["10.222.4.0/22", "10.222.12.0/22", "10.222.20.0/22", "10.222.28.0/22" ]
  public_subnets  = ["10.222.0.0/22","10.222.8.0/22", "10.222.16.0/22", "10.222.24.0/22" ]
  private_propagating_vgws = ["vgw-ba927bd3"]
  public_propagating_vgws = ["vgw-ba927bd3"]

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
