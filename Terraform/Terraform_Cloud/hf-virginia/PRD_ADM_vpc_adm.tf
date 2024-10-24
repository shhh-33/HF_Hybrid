resource "aws_vpc" "PRD-ADM-VPC" {
    cidr_block = "10.240.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
      "Name" = "PRD-ADM-VPC"
    }
}
