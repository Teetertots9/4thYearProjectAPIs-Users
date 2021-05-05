resource "aws_iam_role_policy_attachment" "users-api-authorizer-attach" {
  role       = aws_iam_role.users-api-authorizer-role.name
  policy_arn = aws_iam_policy.users-api-authorizer-policy.arn
}

resource "aws_iam_role_policy_attachment" "authenticate-attach" {
  role       = aws_iam_role.authenticate-role.name
  policy_arn = aws_iam_policy.authenticate-policy.arn
}

resource "aws_iam_role_policy_attachment" "get-users-attach" {
  role       = aws_iam_role.get-users-role.name
  policy_arn = aws_iam_policy.get-users-policy.arn
}

resource "aws_iam_role_policy_attachment" "create-user-attach" {
  role       = aws_iam_role.create-user-role.name
  policy_arn = aws_iam_policy.create-user-policy.arn
}

resource "aws_iam_role_policy_attachment" "get-user-details-attach" {
  role       = aws_iam_role.get-user-details-role.name
  policy_arn = aws_iam_policy.get-user-details-policy.arn
}

resource "aws_iam_role_policy_attachment" "delete-user-attach" {
  role       = aws_iam_role.delete-user-role.name
  policy_arn = aws_iam_policy.delete-user-policy.arn
}

resource "aws_iam_role_policy_attachment" "list-user-auth-events-attach" {
  role       = aws_iam_role.list-user-auth-events-role.name
  policy_arn = aws_iam_policy.list-user-auth-events-policy.arn
}

resource "aws_iam_role_policy_attachment" "change-user-status-attach" {
  role       = aws_iam_role.change-user-status-role.name
  policy_arn = aws_iam_policy.change-user-status-policy.arn
}

resource "aws_iam_role_policy_attachment" "get-groups-attach" {
  role       = aws_iam_role.get-groups-role.name
  policy_arn = aws_iam_policy.get-groups-policy.arn
}

resource "aws_iam_role_policy_attachment" "create-group-attach" {
  role       = aws_iam_role.create-group-role.name
  policy_arn = aws_iam_policy.create-group-policy.arn
}

resource "aws_iam_role_policy_attachment" "get-group-details-attach" {
  role       = aws_iam_role.get-group-details-role.name
  policy_arn = aws_iam_policy.get-group-details-policy.arn
}

resource "aws_iam_role_policy_attachment" "delete-group-attach" {
  role       = aws_iam_role.delete-group-role.name
  policy_arn = aws_iam_policy.delete-group-policy.arn
}

resource "aws_iam_role_policy_attachment" "add-to-group-attach" {
  role       = aws_iam_role.add-to-group-role.name
  policy_arn = aws_iam_policy.add-to-group-policy.arn
}

resource "aws_iam_role_policy_attachment" "remove-from-group-attach" {
  role       = aws_iam_role.remove-from-group-role.name
  policy_arn = aws_iam_policy.remove-from-group-policy.arn
}
