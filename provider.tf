terraform {
  backend "s3" {
    bucket       = "rwterraformstate"
    key          = "terraform_state"
    region       = "us-east-1"
    use_lockfile = true
 default_tags {
   tags = {
     Environment = "Test"
     Owner       = "TFProviders"
     Project     = "Test"
   }}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

}
