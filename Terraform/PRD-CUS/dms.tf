
# 복제 서브넷 그룹 생성
resource "aws_dms_subnet_group" "hf_replication_subnet_group" {
  subnet_group_id = "hf_replication_subnet_group"
  subnet_ids      = [aws_subnet.PRD-CUS-VPC-PRI-2A.id, aws_subnet.PRD-CUS-VPC-PRI-2C.id] 

  tags = {
    Name = "hf_replication_subnet_group"
  }
}

# DMS Replication Instance 생성
resource "aws_dms_replication_instance" "hf_replication_instance" {
  replication_instance_id       = "hf_replication_instance"
  replication_instance_class    = "dms.t3.medium"
  allocated_storage             = 50
  vpc_security_group_ids        = [aws_security_group.PRD-DB-SG.id] 
  replication_subnet_group_id   = aws_dms_subnet_group.hf_replication_subnet_group.id  # 수정
  availability_zone             = "ap-northeast-2a"    # 단일 가용 영역으로 설정
  publicly_accessible           = false                # 퍼블릭 액세스 비활성화
  auto_minor_version_upgrade     = false                # 자동 버전 업그레이드 비활성화
  
  tags = {
    Name = "hf_replication_instance"
  }
}

# 소스 데이터베이스 엔드포인트 생성
resource "aws_dms_endpoint" "hf-source" {
  endpoint_id    = "hf-source-endpoint" 
  endpoint_type  = "source"
  engine_name    = "mariadb"  
  username       = "ham"       
  password       = "12341234" 
  database_name  = "test" 
  server_name    = aws_db_instance.db.address  # 서버 이름
  port           = 3306        
  ssl_mode       = "none"      # SSL 모드

  tags = {
    Name = "Source Database Endpoint"
  }
}

# 타겟 데이터베이스 엔드포인트 생성
resource "aws_dms_endpoint" "hf-target" {
  endpoint_id    = "target-endpoint"
  endpoint_type  = "target"
  engine_name    = "mariadb"  
  username       = "ham"
  password       = "12341234"
  database_name  = "test"
  server_name    = aws_db_instance.db.address
  port           = 3306  
  ssl_mode       = "none"

  tags = {
    Name = "Target Database Endpoint"
  }
}

# DMS Migration Task 생성
resource "aws_dms_replication_task" "hf-task" {
  replication_task_id   = "hf-task"
  migration_type        = "full-load-and-cdc"   # 기존 마이그레이션 복제 및 지속적인 변경사항 복제
  replication_instance_arn = aws_dms_replication_instance.hf_replication_instance.replication_instance_arn
  source_endpoint_arn   = aws_dms_endpoint.hf-source.arn
  target_endpoint_arn   = aws_dms_endpoint.hf-target.arn
  table_mappings        = jsonencode({
    rules = [
      {
        rule_type = "selection",      # 수정
        rule_id   = "1",
        rule_action = "include",      # 수정
        filters = [
          {
            filter_type = "source",   # 수정
            schema_name = "test",    # 소스 스키마 이름
            table_name  = "%"         # 모든 테이블을 포함
          }
        ]
      }
    ]
  })

  tags = {
    Name = "hf-task"
  }
}