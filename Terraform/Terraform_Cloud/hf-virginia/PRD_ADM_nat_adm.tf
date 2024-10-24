resource "aws_eip" "nat-ip01" {
    vpc = "true"
  
}

resource "aws_eip" "nat-ip02" {
    vpc = "true"
  
}

resource "aws_nat_gateway" "PRD-ADM-NGW-1A" {
    allocation_id = aws_eip.nat-ip01.id
    subnet_id = aws_subnet.PRD-ADM-VPC-BASTION-PUB-1A.id
    tags = {
      "Name" = "PRD-ADM-NGW-1A"
    }
  
}

resource "aws_nat_gateway" "PRD-ADM-NGW-1C" {
    allocation_id = aws_eip.nat-ip02.id
    subnet_id = aws_subnet.PRD-ADM-VPC-BASTION-PUB-1C.id
    tags = {
      "Name" = "PRD-ADM-NGW-1C"
    }
  
}
