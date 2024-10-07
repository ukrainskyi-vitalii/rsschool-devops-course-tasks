resource "aws_iam_role" "GithubActionsRole" {
  name = "GithubActionsRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Federated = "arn:aws:iam::${var.aws_account_id}:oidc-provider/token.actions.githubusercontent.com"
        },
        Action = "sts:AssumeRoleWithWebIdentity",
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          },
          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:${var.github_repo_name}:*"
          }
        }
      }
    ]
  })
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_iam_role_policy_attachment" "GithubActionsRole_ec2" {
  role       = aws_iam_role.GithubActionsRole.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_iam_role_policy_attachment" "GithubActionsRole_eventbridge" {
  role       = aws_iam_role.GithubActionsRole.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEventBridgeFullAccess"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_iam_role_policy_attachment" "GithubActionsRole_route53" {
  role       = aws_iam_role.GithubActionsRole.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_iam_role_policy_attachment" "GithubActionsRole_s3" {
  role       = aws_iam_role.GithubActionsRole.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_iam_role_policy_attachment" "GithubActionsRole_sqs" {
  role       = aws_iam_role.GithubActionsRole.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_iam_role_policy_attachment" "GithubActionsRole_vpc" {
  role       = aws_iam_role.GithubActionsRole.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_iam_role_policy_attachment" "GithubActionsRole_iam" {
  role       = aws_iam_role.GithubActionsRole.name
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_iam_role_policy_attachment" "GithubActionsRole_dynamodb" {
  role       = aws_iam_role.GithubActionsRole.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  lifecycle {
    prevent_destroy = true
  }
}
