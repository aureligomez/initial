module "vpc" {
  source = "github.com/terraform-community-modules/tf_aws_vpc"

  name = "MCOM-STG"

  cidr = "10.222.64.0/18"
  private_subnets = ["10.222.68.0/22", "10.222.76.0/22", "10.222.84.0/22", "10.222.92.0/22" ]
  public_subnets  = ["10.222.64.0/22","10.222.72.0/22", "10.222.80.0/22", "10.222.88.0/22" ]
  private_propagating_vgws = ["vgw-b8927bd1"]
  public_propagating_vgws = ["vgw-b8927bd1"]

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
