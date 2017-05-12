variable "pub_rt_count" {
    default = 1
}

variable "priv_rt_count" {
    default = 4
}

resource "aws_route" "pub_to_dev" {
    count = 1
    route_table_id = "${module.vpc.public_route_table_ids["${count.index}"]}"
    destination_cidr_block = "${var.vpc_cidr["dev"]}"
    vpc_peering_connection_id = "${data.terraform_remote_state.dev.aws_vpc_peering_connection_demo_id}"
}

resource "aws_route" "priv_to_dev" {
    count = 4
    route_table_id = "${module.vpc.private_route_table_ids["${count.index}"]}"
    destination_cidr_block = "${var.vpc_cidr["dev"]}"
    vpc_peering_connection_id = "${data.terraform_remote_state.dev.aws_vpc_peering_connection_demo_id}"
}
