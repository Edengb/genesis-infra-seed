variable "aws_region" {
  description = "AWS region."
  type        = string

  validation {
    condition     = can(regex("^[a-z]{2}-[a-z]+-[0-9]$", var.aws_region))
    error_message = "aws_region must look like us-east-1 / eu-west-2."
  }
}

variable "aws_account_id" {
  description = "AWS account ID that GenesisInfraSeed manages."
  type        = string

  validation {
    condition     = can(regex("^[0-9]{12}$", var.aws_account_id))
    error_message = "aws_account_id must be 12 digits."
  }
}

variable "github_org" {
  description = "Github organization that owns the GenesisInfraSeed repo."
  type        = string

  validation {
    condition     = can(regex("^[A-Za-z0-9][A-Za-z0-9-]{0,38}$", var.github_org))
    error_message = "github_org must be a valid GitHub org slug (1-39 chars, alphanumeric or hyphen, no leading hyphen)."
  }
}

variable "github_repo" {
  description = "Github repository name of the GenesisInfraSeed."
  type        = string

  validation {
    condition     = can(regex("^[A-Za-z0-9][A-Za-z0-9-]{0,99}$", var.github_repo))
    error_message = "github_repo must be alphanumeric with hyphens only (no leading hyphen), 1-100 chars."
  }
}

variable "owner_tag" {
  description = "Value for the required Owner tag. Team handle or engineer handle."
  type        = string

  validation {
    condition     = length(var.owner_tag) > 0
    error_message = "owner_tag must not be empty."
  }
}