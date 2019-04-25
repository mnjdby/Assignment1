# config.tf

provider "aws" {
  region = "ap-southeast-1"

  assume_role {
    role_arn = "arn:aws:iam::410034047840:role/TerraformAdmin"
  }
}

terraform {
  backend "s3" {
     bucket   = "terraformstatefileformanuj"
     key      = "statetest.tf"
     region   = "ap-southeast-1"
     role_arn = "arn:aws:iam::410034047840:role/TerraformAdmin"
  }
}
