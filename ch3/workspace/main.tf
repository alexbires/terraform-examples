resource "aws_instance" "example" {
    ami         = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
}

provider "aws" {
    version     = "~> 2.0"
    region      = "us-east-2"
}


#configure the backend
terraform {
    backend "s3" {
        bucket      = "closer-to-the-heart-yeah"
        key         = "workspaces-example/terraform.tfstate"
        region      = "us-east-2"
        
        dynamodb_table = "terraform-locks"
        encrypt        = true   
    }
}