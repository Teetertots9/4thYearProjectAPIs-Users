#
# Configure the S3 backend, which needs to be set up separately
#
terraform {
  backend "s3" {
    region     = "eu-west-1"
    bucket         = "seobooker.tf-prod-infra-state"
    key            = "api/users-api/terraform.tfstate"
    dynamodb_table = "seobooker_prod_infra"
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = var.region
}

#
# Set up the api resources
#
module api {
  source = "../../modules/api"
  region = var.region
  stage = var.stage
  prefix = var.prefix
  account_id = var.account_id
  runtime = var.runtime
  userpool_id = var.cognito_user_pool_id
  client_id = var.cognito_client_id
//  make sure api_domain is correct for different stages after generation
  api_domain = var.api_domain
}
