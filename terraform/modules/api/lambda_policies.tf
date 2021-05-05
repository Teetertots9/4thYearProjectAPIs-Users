resource "aws_iam_role_policy" "users-api-authorizer-invocation-policy" {
  name = "${var.prefix}-users-api-authorizer-invocation-policy-${var.stage}"
  role = aws_iam_role.users-api-authorizer-invocation-role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "lambda:InvokeFunction",
      "Effect": "Allow",
      "Resource": "${aws_lambda_function.users-api-authorizer.arn}"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "users-api-authorizer-policy" {
  name        = "${var.prefix}-users-api-authorizer-policy-${var.stage}"
  description = ""
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": [
        "arn:aws:logs:*:*:*"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "authenticate-invocation-policy" {
  name = "${var.prefix}-authenticate-invocation-policy-${var.stage}"
  role = aws_iam_role.authenticate-invocation-role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "lambda:InvokeFunction",
      "Effect": "Allow",
      "Resource": "${aws_lambda_function.authenticate.arn}"
    }
  ]
}
EOF
}
resource "aws_iam_policy" "authenticate-policy" {
  name        = "${var.prefix}-authenticate-policy-${var.stage}"
  description = ""
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": [
        "arn:aws:logs:*:*:*"
      ]
    },
    {
      "Action": [
        "cognito-idp:AdminInitiateAuth"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:cognito-idp:${var.region}:${var.account_id}:userpool/${var.userpool_id}"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "get-users-policy" {
  name        = "${var.prefix}-get-users-policy-${var.stage}"
  description = ""
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": [
        "arn:aws:logs:*:*:*"
      ]
    },
    {
      "Action": [
        "cognito-idp:ListUsers"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:cognito-idp:${var.region}:${var.account_id}:userpool/${var.userpool_id}"
    }
  ]
}
EOF
}


resource "aws_iam_policy" "create-user-policy" {
  name        = "${var.prefix}-create-user-policy-${var.stage}"
  description = ""
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": [
        "arn:aws:logs:*:*:*"
      ]
    },
    {
      "Action": [
        "cognito-idp:AdminCreateUser"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:cognito-idp:${var.region}:${var.account_id}:userpool/${var.userpool_id}"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "get-user-details-policy" {
  name        = "${var.prefix}-get-user-details-policy-${var.stage}"
  description = ""
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": [
        "arn:aws:logs:*:*:*"
      ]
    },
    {
      "Action": [
        "cognito-idp:AdminGetUser"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:cognito-idp:${var.region}:${var.account_id}:userpool/${var.userpool_id}"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "delete-user-policy" {
  name        = "${var.prefix}-delete-user-policy-${var.stage}"
  description = ""
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": [
        "arn:aws:logs:*:*:*"
      ]
    },
    {
      "Action": [
        "cognito-idp:AdminDeleteUser"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:cognito-idp:${var.region}:${var.account_id}:userpool/${var.userpool_id}"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "list-user-auth-events-policy" {
  name        = "${var.prefix}-list-user-auth-events-policy-${var.stage}"
  description = ""
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": [
        "arn:aws:logs:*:*:*"
      ]
    },
    {
      "Action": [
        "cognito-idp:AdminListUserAuthEvents"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:cognito-idp:${var.region}:${var.account_id}:userpool/${var.userpool_id}"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "change-user-status-policy" {
  name        = "${var.prefix}-change-user-status-policy-${var.stage}"
  description = ""
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": [
        "arn:aws:logs:*:*:*"
      ]
    },
    {
      "Action": [
        "cognito-idp:AdminEnableUser",
        "cognito-idp:AdminDisableUser"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:cognito-idp:${var.region}:${var.account_id}:userpool/${var.userpool_id}"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "get-groups-policy" {
  name        = "${var.prefix}-get-groups-policy-${var.stage}"
  description = ""
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": [
        "arn:aws:logs:*:*:*"
      ]
    },
    {
      "Action": [
        "cognito-idp:ListGroups"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:cognito-idp:${var.region}:${var.account_id}:userpool/${var.userpool_id}"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "create-group-policy" {
  name        = "${var.prefix}-create-group-policy-${var.stage}"
  description = ""
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": [
        "arn:aws:logs:*:*:*"
      ]
    },
    {
      "Action": [
        "cognito-idp:CreateGroup"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:cognito-idp:${var.region}:${var.account_id}:userpool/${var.userpool_id}"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "get-group-details-policy" {
  name        = "${var.prefix}-get-group-details-policy-${var.stage}"
  description = ""
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": [
        "arn:aws:logs:*:*:*"
      ]
    },
    {
      "Action": [
        "cognito-idp:ListUsersInGroup"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:cognito-idp:${var.region}:${var.account_id}:userpool/${var.userpool_id}"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "delete-group-policy" {
  name        = "${var.prefix}-delete-group-policy-${var.stage}"
  description = ""
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": [
        "arn:aws:logs:*:*:*"
      ]
    },
    {
      "Action": [
        "cognito-idp:DeleteGroup"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:cognito-idp:${var.region}:${var.account_id}:userpool/${var.userpool_id}"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "add-to-group-policy" {
  name        = "${var.prefix}-add-to-group-policy-${var.stage}"
  description = ""
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": [
        "arn:aws:logs:*:*:*"
      ]
    },
    {
      "Action": [
        "cognito-idp:AdminAddUserToGroup"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:cognito-idp:${var.region}:${var.account_id}:userpool/${var.userpool_id}"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "remove-from-group-policy" {
  name        = "${var.prefix}-remove-from-group-policy-${var.stage}"
  description = ""
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": [
        "arn:aws:logs:*:*:*"
      ]
    },
    {
      "Action": [
        "cognito-idp:AdminRemoveUserFromGroup"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:cognito-idp:${var.region}:${var.account_id}:userpool/${var.userpool_id}"
    }
  ]
}
EOF
}
