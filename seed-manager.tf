resource "aws_iam_policy" "seed_manager_boundary" {
  name        = "genesis-seed-manager-boundary"
  description = "Permissions Boundary for SeedManagerRole."
  policy = templatefile("${path.module}/policies/seed-manager-boundary.json", {
    aws_account_id = var.aws_account_id
    aws_region     = var.aws_region
  })

  tags = local.common_tags
}

resource "aws_iam_role" "seed_manager" {
  name        = "genesis-seed-manager-role"
  description = "Assumed by GitHub Actions in <org>/infraseed via OIDC to manage workload repos and their IAM."
  assume_role_policy = templatefile("${path.module}/policies/github-assume-role-policy.json", {
    aws_account_id = var.aws_account_id,
    github_org     = var.github_org,
    github_repo    = var.github_repo
  })
  permissions_boundary = aws_iam_policy.seed_manager_boundary.arn
  max_session_duration = 3600

  tags = local.common_tags
}

resource "aws_iam_role_policy" "seed_manager_permissions" {
  name = "genesis-seed-manager-permissions"
  role = aws_iam_role.seed_manager.id
  policy = templatefile("${path.module}/policies/seed-manager-permissions.json", {
    aws_account_id = var.aws_account_id
    aws_region     = var.aws_region
  })
}