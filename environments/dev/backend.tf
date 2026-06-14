terraform {

  backend "s3" {

    bucket         = "tf-state-179503922299-us-east-1"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true

  }

}
