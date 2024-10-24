# Key (ssh-keygen -m PEM -f sh)
resource "aws_key_pair" "key" {
  key_name   = "sh"
  public_key = file("sh.pub")
}

resource "aws_instance" "PRD-VPC-ROUTE-1A" {
  ami                    = coalesce(data.aws_ami.amzlinux2.id)
  instance_type          = "t2.medium"
  key_name               = "sh"
  vpc_security_group_ids = [aws_security_group.PRD-VPC-ROUTE-SG-1A.id]
  subnet_id              = aws_subnet.PRD-ADM-VPC-BASTION-PUB-1A.id
  private_ip             = "10.240.1.241"

  tags = {
    Name = "PRD-VPC-ROUTE-1A"
  }

  source_dest_check = false
}

#### PRI-1A Subnet : Bastion Instance 생성 ####
resource "aws_instance" "PRD-VPC-Bastion-PUB-1A" {
  ami                    = coalesce(data.aws_ami.ubuntu.id)
  instance_type          = "t2.medium"
  key_name               = "sh"
  vpc_security_group_ids = [aws_security_group.PRD-VPC-Bastion-PUB-SG-1A.id]
  subnet_id              = aws_subnet.PRD-ADM-VPC-BASTION-PUB-1A.id
  private_ip             = "10.240.1.240"

  tags = {
    Name = "PRD-VPC-Bastion-PUB-1A"
  }
}

# #### PRI-1A Subnet : LB Instance 생성 ####
# resource "aws_instance" "PRD-VPC-PRI-LB-1A" {
#   ami                    = coalesce(data.aws_ami.ubuntu.id)
#   instance_type          = "t3.medium"
#   key_name               = "sh"
#   vpc_security_group_ids = [aws_security_group.PRD-VPC-PRI-LB-SG-1A.id]
#   subnet_id              = aws_subnet.PRD-ADM-VPC-PRI-1A.id
#   private_ip             = "10.240.2.251"

#   tags = {
#     Name = "PRD-VPC-PRI-LB-1A"
#   }
# } 


# #### PRI-1A Subnet : Master1 Instance 생성 ####
# resource "aws_instance" "PRD-VPC-PRI-MASTER1-1A" {
#   ami                    = coalesce(data.aws_ami.ubuntu.id)
#   instance_type          = "t3.medium"
#   key_name               = "sh"
#   vpc_security_group_ids = [aws_security_group.PRD-VPC-PRI-MASTER1-SG-1A.id]
#   subnet_id              = aws_subnet.PRD-ADM-VPC-PRI-1A.id
#   private_ip             = "10.240.2.241"

#   tags = {
#     Name = "PRD-VPC-PRI-MASTER1-1A"
#   }
# }



# #### PRI-1A Subnet : WORKER1 Instance 생성 ####
# resource "aws_instance" "PRD-VPC-PRI-WORKER1-1A" {
#   ami                    = coalesce(data.aws_ami.ubuntu.id)
#   instance_type          = "t3.medium"
#   key_name               = "sh"
#   vpc_security_group_ids = [aws_security_group.PRD-VPC-PRI-WORKER1-SG-1A.id]
#   subnet_id              = aws_subnet.PRD-ADM-VPC-PRI-1A.id
#   private_ip             = "10.240.2.244"

#   tags = {
#     Name = "PRD-VPC-PRI-WORKER1-1A"
#   }
# }



# #### PRI-1A Subnet : WORKER2 Instance 생성 ####
# resource "aws_instance" "PRD-VPC-PRI-WORKER2-1A" {
#   ami                    = coalesce(data.aws_ami.ubuntu.id)
#   instance_type          = "t3.medium"
#   key_name               = "sh"
#   vpc_security_group_ids = [aws_security_group.PRD-VPC-PRI-WORKER2-SG-1A.id]
#   subnet_id              = aws_subnet.PRD-ADM-VPC-PRI-1A.id
#   private_ip             = "10.240.2.245"

#   tags = {
#     Name = "PRD-VPC-PRI-WORKER2-1A"
#   }
# }



# #### PRI-1C Subnet : WORKER3 Instance 생성 ####
# resource "aws_instance" "PRD-VPC-PRI-WORKER3-1C" {
#   ami                    = coalesce(data.aws_ami.ubuntu.id)
#   instance_type          = "t3.medium"
#   key_name               = "sh"
#   vpc_security_group_ids = [aws_security_group.PRD-VPC-PRI-WORKER3-SG-1C.id]
#   subnet_id              = aws_subnet.PRD-ADM-VPC-PRI-1C.id
#   private_ip             = "10.240.12.246"

#   tags = {
#     Name = "PRD-VPC-PRI-WORKER3-1C"
#   }
# }




# #### PRI-1C Subnet : MASTER2 Instance 생성 ####
# resource "aws_instance" "PRD-VPC-PRI-MASTER2-1C" {
#   ami                    = coalesce(data.aws_ami.ubuntu.id)
#   instance_type          = "t3.medium"
#   key_name               = "sh"
#   vpc_security_group_ids = [aws_security_group.PRD-VPC-PRI-MASTER2-SG-1C.id]
#   subnet_id              = aws_subnet.PRD-ADM-VPC-PRI-1C.id
#   private_ip             = "10.240.12.242"

#   tags = {
#     Name = "PRD-VPC-PRI-MASTER2-1C"
#   }
# }

# #### PRI-1C Subnet : MASTER3 Instance 생성 ####
# resource "aws_instance" "PRD-VPC-PRI-MASTER3-1C" {
#   ami                    = coalesce(data.aws_ami.ubuntu.id)
#   instance_type          = "t3.medium"
#   key_name               = "sh"
#   vpc_security_group_ids = [aws_security_group.PRD-VPC-PRI-MASTER3-SG-1C.id]
#   subnet_id              = aws_subnet.PRD-ADM-VPC-PRI-1C.id
#   private_ip             = "10.240.12.243"

#   tags = {
#     Name = "PRD-VPC-PRI-MASTER3-1C"
#   }
# }

# #### PRI-1C Subnet : MASTER3 Instance 생성 ####
# resource "aws_instance" "PRD-VPC-PRI-DB1-1A" {
#   ami                    = coalesce(data.aws_ami.ubuntu.id)
#   instance_type          = "t3.medium"
#   key_name               = "sh"
#   vpc_security_group_ids = [aws_security_group.PRD-DB-SG.id]
#   subnet_id              = aws_subnet.PRD-ADM-VPC-PRI-1A.id
#   private_ip             = "10.240.2.250"

#   tags = {
#     Name = "PRD-VPC-PRI-DB1-1A"
#   }
# }

# #### PRI-1C Subnet : MASTER3 Instance 생성 ####
# resource "aws_instance" "PRD-VPC-PRI-DB1-1C" {
#   ami                    = coalesce(data.aws_ami.ubuntu.id)
#   instance_type          = "t3.medium"
#   key_name               = "sh"
#   vpc_security_group_ids = [aws_security_group.PRD-DB-SG.id]
#   subnet_id              = aws_subnet.PRD-ADM-VPC-PRI-1C.id
#   private_ip             = "10.240.12.250"

#   tags = {
#     Name = "PRD-VPC-PRI-DB1-1C"
#   }
# }

data "aws_ami" "amzlinux2" {
  most_recent = true
  owners      = ["amazon"]
  name_regex  = "^amzn2-"

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*-gp2"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }


}

# Ubuntu 20.04 AMI 검색
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Ubuntu 공식 AWS 계정 ID
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}
