resource "aws_iam_instance_profile" "Jenkins_profile" {
  name = "jenkins_profile"
  role = aws_iam_role.jenkins_role.name

  }

resource "aws_iam_role" "jenkins_role" {
  name = "jenkins_role"
  path = "/"
  managed_policy_arns = [aws_iam_policy.s3_policy.arn]
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_policy" "s3_policy" {
  name = "policy-s3"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:ListAllMyBuckets", "s3:ListBucket", "s3:HeadBucket"]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}