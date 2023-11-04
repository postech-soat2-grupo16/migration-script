provider "aws" {
  region = var.aws_region
}

#Configuração do Terraform State
terraform {
  backend "s3" {
    bucket = "terraform-state-soat"
    key    = "infra-script-migration/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "terraform-state-soat-locking"
    encrypt        = true
  }
}

### Upload arquivo ao S3
resource "aws_s3_bucket_object" "object" {
  bucket = "terraform-state-soat"
  key    = "scripts/fastfood.sql"
  source = "script/init.sql"
}
