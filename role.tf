resource "aws_iam_instance_profile" "webserver_profile_p2" {
  name = "webserver_profile_p2"
  role = aws_iam_role.webserver_role_p2.name
}

resource "aws_iam_role" "webserver_role_p2" {
  name = "webserver_role_p2"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [{
      "Effect" : "Allow",
      "Principal" : {
        "Service" : "ec2.amazonaws.com"
      },
      "Action" : "sts:AssumeRole"
    }]
  })
}

#resource "aws_iam_policy" "webserver_policy_p2" {
#  name        = "webserver-policy_p2"
#  description = "webserver policy for EC2 instances"
#  policy      = jsonencode({
#    "Version" : "2012-10-17",
#    "Statement" : [{
#      "Effect"    : "Allow",
#      "Action"    : "s3:GetObject",
#      "Resource"  : "*"
#    }]
#  })
#}
#
#resource "aws_iam_role_policy_attachment" "webserver_attachment" {
#  role       = aws_iam_role.webserver_role_p2.name
#  policy_arn = aws_iam_policy.webserver_policy_p2.arn
#}
