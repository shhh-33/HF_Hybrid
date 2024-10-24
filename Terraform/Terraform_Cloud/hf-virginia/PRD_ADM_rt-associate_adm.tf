### public route association ####

resource "aws_route_table_association" "rt_associate-public01" {
    subnet_id = aws_subnet.PRD-ADM-VPC-BASTION-PUB-1A.id
    route_table_id = aws_route_table.PRD-ADM-RT-PUB.id
}

resource "aws_route_table_association" "rt_associate-public02" {
    subnet_id = aws_subnet.PRD-ADM-VPC-BASTION-PUB-1C.id
    route_table_id = aws_route_table.PRD-ADM-RT-PUB.id
}


### pirvate route association ###

resource "aws_route_table_association" "rt_associate-private01" {
    subnet_id = aws_subnet.PRD-ADM-VPC-PRI-1A.id
    route_table_id = aws_route_table.PRD-ADM-RT-PRI-1A.id
}

resource "aws_route_table_association" "rt_associate-private02" {
    subnet_id = aws_subnet.PRD-ADM-VPC-PRI-1C.id
    route_table_id = aws_route_table.PRD-ADM-RT-PRI-1C.id
}