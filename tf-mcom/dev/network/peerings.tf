resource "aws_vpc_peering_connection" "prod" {
    auto_accept = true 
    peer_vpc_id = "${data.terraform_remote_state.prod.vpc_id}"
    vpc_id = "${module.vpc.vpc_id}"

    accepter {
      allow_remote_vpc_dns_resolution = true
    }

    requester {
      allow_remote_vpc_dns_resolution = true
    }

    tags {
      Name = "PROD to DEV"
    }
}

resource "aws_vpc_peering_connection" "stg" {
    auto_accept = true
    peer_vpc_id = "${data.terraform_remote_state.stg.vpc_id}"
    vpc_id = "${module.vpc.vpc_id}"

    accepter {
      allow_remote_vpc_dns_resolution = true
    }

    requester {
      allow_remote_vpc_dns_resolution = true
    }

    tags {
      Name = "STG to DEV"
    }
}

resource "aws_vpc_peering_connection" "demo" {
    auto_accept = true
    peer_vpc_id = "${data.terraform_remote_state.demo.vpc_id}"
    vpc_id = "${module.vpc.vpc_id}"

    accepter {
      allow_remote_vpc_dns_resolution = true
    }

    requester {
      allow_remote_vpc_dns_resolution = true
    }

    tags {
      Name = "DEMO to DEV"
    }
}
