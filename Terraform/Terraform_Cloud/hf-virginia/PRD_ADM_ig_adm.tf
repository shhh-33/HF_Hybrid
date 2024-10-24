resource "aws_internet_gateway" "PRD-ADM-IGW" {
    vpc_id = aws_vpc.PRD-ADM-VPC.id
    tags = {
      "Name" = "PRD-ADM-IGW"
    }
  
}