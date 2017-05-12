output "aws_vpc_peering_connection_prod_id" {
  value = "${aws_vpc_peering_connection.prod.id}"
}

output "aws_vpc_peering_connection_stg_id" {
  value = "${aws_vpc_peering_connection.stg.id}"
}

output "aws_vpc_peering_connection_demo_id" {
  value = "${aws_vpc_peering_connection.demo.id}"
}
