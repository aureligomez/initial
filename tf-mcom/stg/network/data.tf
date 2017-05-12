data "terraform_remote_state" "prod" {
    backend = "s3"
    config {
        bucket = "tf-mcom"
        key = "PROD/network/terraform.tfstate"
        region = "us-east-1"
    }
}

data "terraform_remote_state" "dev" {
    backend = "s3"
    config {
        bucket = "tf-mcom"
        key = "DEV/network/terraform.tfstate"
        region = "us-east-1"
    }
}

data "terraform_remote_state" "demo" {
    backend = "s3"
    config {
        bucket = "tf-mcom"
        key = "DEMO/network/terraform.tfstate"
        region = "us-east-1"
    }
}
