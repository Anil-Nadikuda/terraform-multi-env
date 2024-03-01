terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.33.0"
    }
  }
  backend "s3" {
    # bucket = "daws14-remotestate"
    # key    = "foreach"
    # region = "us-east-1"
    # dynamodb_table = "daws14-locking"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

