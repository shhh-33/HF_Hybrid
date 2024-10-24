
### public route ####

resource "aws_route" "PRD-ADM-RT-PUB" {
    route_table_id = aws_route_table.PRD-ADM-RT-PUB.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.PRD-ADM-IGW.id
  
}


### pirvate route ###

resource "aws_route" "PRD-ADM-RT-PRI-1A" {
    route_table_id = aws_route_table.PRD-ADM-RT-PRI-1A.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.PRD-ADM-NGW-1A.id  
}

resource "aws_route" "PRD-ADM-RT-PRI-1C" {
    route_table_id = aws_route_table.PRD-ADM-RT-PRI-1C.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.PRD-ADM-NGW-1C.id
}

# Site-to-Site 때문에 넣은 것
resource "aws_route" "instance_route" {
  route_table_id         = aws_route_table.PRD-ADM-RT-PUB.id  # 라우팅 테이블 ID
  destination_cidr_block = "10.250.0.0/16"
  network_interface_id    = aws_instance.PRD-VPC-ROUTE-1A.primary_network_interface_id

  depends_on = [aws_instance.PRD-VPC-ROUTE-1A]
}

resource "aws_route" "instance_route-1A" {
  route_table_id         = aws_route_table.PRD-ADM-RT-PRI-1A.id  # 라우팅 테이블 ID
  destination_cidr_block = "10.250.0.0/16"
  network_interface_id    = aws_instance.PRD-VPC-ROUTE-1A.primary_network_interface_id

  depends_on = [aws_instance.PRD-VPC-ROUTE-1A]
}

resource "aws_route" "instance_route-1C" {
  route_table_id         = aws_route_table.PRD-ADM-RT-PRI-1C.id  # 라우팅 테이블 ID
  destination_cidr_block = "10.250.0.0/16"
  network_interface_id    = aws_instance.PRD-VPC-ROUTE-1A.primary_network_interface_id

  depends_on = [aws_instance.PRD-VPC-ROUTE-1A]
}

