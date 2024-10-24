### public route table ####

resource "aws_route_table" "PRD-ADM-RT-PUB" {
    vpc_id = aws_vpc.PRD-ADM-VPC.id
    tags = {
      "Name" = "PRD-ADM-RT-PUB"
    }
  
}

### private route table ####

resource "aws_route_table" "PRD-ADM-RT-PRI-1A" {
    vpc_id = aws_vpc.PRD-ADM-VPC.id
    tags = {
      "Name" = "PRD-ADM-RT-PRI-1A"
    }
}

resource "aws_route_table" "PRD-ADM-RT-PRI-1C" {
    vpc_id = aws_vpc.PRD-ADM-VPC.id
    tags = {
      "Name" = "PRD-ADM-RT-PRI-1C"
    }
  
}