# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = ">= 3.32.0" # 버전 확인
#     }
#   }
# }

provider "aws" {
  region = "us-east-1" #Asia Pacific (seoul) region
}