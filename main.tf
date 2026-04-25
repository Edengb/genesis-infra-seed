locals {
  common_tags = {
    System    = "genesisinfraseed"
    Repo      = "${var.github_org}/${var.github_repo}"
    ManagedBy = "terraform"
    Owner     = var.owner_tag
  }
}

provider "aws" {
  region = var.aws_region

  allowed_account_ids = [var.aws_account_id]

  default_tags {
    tags = local.common_tags
  }
}