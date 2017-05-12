variable "vpc_cidr" {
    default = {
        dev = "10.222.128.0/18"
        stg = "10.222.64.0/18"
        prod = "10.222.0.0/18"
        demo = "10.222.192.0/18"
    }
}
