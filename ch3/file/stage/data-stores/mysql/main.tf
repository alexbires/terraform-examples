
terraform {
    required_version = ">= 0.12, < 0.13"

}

terraform {
    backend "s3"{ 

        bucket  = "oh-yeah-my-s3-bucket-tight"
        key     = "files/terraform.tfstate"
        region  = "us-east-2"
        dynamodb_table = "tf-state-table"
        encrypt = true
    }
}

provider "aws" {
    region      = "us-east-2"

    version     = "~> 2.0"
}

resource "aws_db_instance" "example_db" {
  identifier_prefix     = "terraform-up-and-running"
  engine                = "mysql"
  allocated_storage     = 10
  instance_class        = "db.t2.micro"

  username              = "admin"


  name                  = var.db_name
  skip_final_snapshot   = true

  password              = var.db_password
}
