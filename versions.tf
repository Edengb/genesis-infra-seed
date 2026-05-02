terraform {
  required_version = "~> 1.10"

  backend "s3" {
    # Settings will be provided via -backend-config
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.40"
    }
  }
}