# Triggers built-in AWS-0346: allows both s3:Get* and s3:Put* on all resources
resource "aws_iam_policy" "fail_s3_get_put_wildcard" {
  name        = "fail-s3-get-put-wildcard"
  description = "Policy intentionally overly broad: Get* and Put* on all S3 resources"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "GetAndPutAllS3"
        Effect   = "Allow"
        Action   = ["s3:Get*", "s3:Put*"]
        Resource = "*"
      }
    ]
  })
}
