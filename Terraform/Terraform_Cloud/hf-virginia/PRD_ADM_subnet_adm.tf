
### public subnet ####
resource "aws_subnet" "PRD-ADM-VPC-BASTION-PUB-1A" {
    vpc_id = aws_vpc.PRD-ADM-VPC.id
    cidr_block = "10.240.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = "true"
    tags = {
      "Name" = "PRD-ADM-VPC-BASTION-PUB-1A"
      "kubernetes.io/role/elb" = "1"
      "kubernetes.io/cluster/k8s-cluster" = "shared"
    } 
}

### public subnet ####
resource "aws_subnet" "PRD-ADM-VPC-BASTION-PUB-1C" {
    vpc_id = aws_vpc.PRD-ADM-VPC.id
    cidr_block = "10.240.11.0/24"
    availability_zone = "us-east-1c"
    map_public_ip_on_launch = "true"
    tags = {
      "Name" = "PRD-ADM-VPC-BASTION-PUB-1C"
      "kubernetes.io/role/elb" = "1"
      "kubernetes.io/cluster/k8s-cluster" = "shared"
    } 
}


### pirvate subnet ###
resource "aws_subnet" "PRD-ADM-VPC-PRI-1A" {
    vpc_id = aws_vpc.PRD-ADM-VPC.id
    cidr_block = "10.240.2.0/24"
    availability_zone = "us-east-1a"
    tags = {
      "Name" = "PRD-ADM-VPC-PRI-1A"
      "kubernetes.io/role/internal-elb" = "1" 
      "kubernetes.io/cluster/k8s-cluster" = "shared"
    } 
}

### pirvate subnet ###
resource "aws_subnet" "PRD-ADM-VPC-PRI-1C" {
    vpc_id = aws_vpc.PRD-ADM-VPC.id
    cidr_block = "10.240.12.0/24"
    availability_zone = "us-east-1c"
    tags = {
      "Name" = "PRD-ADM-VPC-PRI-1C"
      "kubernetes.io/role/internal-elb" = "1" 
      "kubernetes.io/cluster/k8s-cluster" = "shared"
    } 
}