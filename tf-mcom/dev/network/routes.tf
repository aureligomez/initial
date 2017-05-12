variable "pub_rt_count" {
    default = 1
}

variable "priv_rt_count" {
    default = 4
}

resource "aws_route" "pub_to_prod" {
    count = 1
    route_table_id = "${module.vpc.public_route_table_ids["${count.index}"]}"
    destination_cidr_block = "${var.vpc_cidr["prod"]}"
    vpc_peering_connection_id = "${aws_vpc_peering_connection.prod.id}"
}

resource "aws_route" "priv_to_prod" {
    count = 4
    route_table_id = "${module.vpc.private_route_table_ids["${count.index}"]}"
    destination_cidr_block = "${var.vpc_cidr["prod"]}"
    vpc_peering_connection_id = "${aws_vpc_peering_connection.prod.id}"
}

resource "aws_route" "pub_to_stg" {
    count = 1
    route_table_id = "${module.vpc.public_route_table_ids["${count.index}"]}"
    destination_cidr_block = "${var.vpc_cidr["stg"]}"
    vpc_peering_connection_id = "${aws_vpc_peering_connection.stg.id}"
}

resource "aws_route" "priv_to_stg" {
    count = 4
    route_table_id = "${module.vpc.private_route_table_ids["${count.index}"]}"
    destination_cidr_block = "${var.vpc_cidr["stg"]}"
    vpc_peering_connection_id = "${aws_vpc_peering_connection.stg.id}"
}

resource "aws_route" "pub_to_demo" {
    count = 1
    route_table_id = "${module.vpc.public_route_table_ids["${count.index}"]}"
    destination_cidr_block = "${var.vpc_cidr["demo"]}"
    vpc_peering_connection_id = "${aws_vpc_peering_connection.demo.id}"
}

resource "aws_route" "priv_to_demo" {
    count = 4
    route_table_id = "${module.vpc.private_route_table_ids["${count.index}"]}"
    destination_cidr_block = "${var.vpc_cidr["demo"]}"
    vpc_peering_connection_id = "${aws_vpc_peering_connection.demo.id}"
}
