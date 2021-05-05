resource "aws_lambda_function" "users-api-authorizer" {
  function_name = "${var.prefix}-users-api-authorizer-${var.stage}"

  # The zip containing the lambda function
  filename    = "../../../lambda/dist/functions/api-authorizer.zip"
  source_code_hash = filebase64sha256("../../../lambda/dist/functions/api-authorizer.zip")

  # "index" is the filename within the zip file (index.js) and "handler"
  # is the name of the property under which the handler function was
  # exported in that file.
  handler = "index.handler"
  runtime = var.runtime
  timeout = 10

  role = aws_iam_role.users-api-authorizer-role.arn

  layers = [aws_lambda_layer_version.lambda_layer.id]

  environment {
    variables = {
      region = var.region,
      userpoolId = var.userpool_id
    }
  }
}

resource "aws_lambda_function" "authenticate" {
  function_name = "${var.prefix}-authenticate-${var.stage}"

  # The zip containing the lambda function
  filename    = "../../../lambda/dist/functions/authenticate.zip"
  source_code_hash = filebase64sha256("../../../lambda/dist/functions/authenticate.zip")

  # "index" is the filename within the zip file (index.js) and "handler"
  # is the name of the property under which the handler function was
  # exported in that file.
  handler = "index.handler"
  runtime = var.runtime
  timeout = 10

  role = aws_iam_role.authenticate-role.arn

  layers = [aws_lambda_layer_version.lambda_layer.id]

  environment {
    variables = {
      userpoolId = var.userpool_id,
      clientId = var.client_id,
      region = var.region
    }
  }
}

resource "aws_lambda_function" "get-users" {
  function_name = "${var.prefix}-get-users-${var.stage}"

  # The zip containing the lambda function
  filename    = "../../../lambda/dist/functions/get-users.zip"
  source_code_hash = filebase64sha256("../../../lambda/dist/functions/get-users.zip")

  # "index" is the filename within the zip file (index.js) and "handler"
  # is the name of the property under which the handler function was
  # exported in that file.
  handler = "index.handler"
  runtime = var.runtime
  timeout = 10

  role = aws_iam_role.get-users-role.arn

  layers = [aws_lambda_layer_version.lambda_layer.id]

  environment {
    variables = {
      userpoolId = var.userpool_id,
      region = var.region
    }
  }
}

resource "aws_lambda_function" "create-user" {
  function_name = "${var.prefix}-create-user-${var.stage}"

  # The zip containing the lambda function
  filename    = "../../../lambda/dist/functions/create-user.zip"
  source_code_hash = filebase64sha256("../../../lambda/dist/functions/create-user.zip")

  # "index" is the filename within the zip file (index.js) and "handler"
  # is the name of the property under which the handler function was
  # exported in that file.
  handler = "index.handler"
  runtime = var.runtime
  timeout = 10

  role = aws_iam_role.create-user-role.arn

  layers = [aws_lambda_layer_version.lambda_layer.id]

  environment {
    variables = {
      userpoolId = var.userpool_id,
      region =  var.region
    }
  }
}

resource "aws_lambda_function" "get-user-details" {
  function_name = "${var.prefix}-get-user-details-${var.stage}"

  # The zip containing the lambda function
  filename    = "../../../lambda/dist/functions/get-user-details.zip"
  source_code_hash = filebase64sha256("../../../lambda/dist/functions/get-user-details.zip")

  # "index" is the filename within the zip file (index.js) and "handler"
  # is the name of the property under which the handler function was
  # exported in that file.
  handler = "index.handler"
  runtime = var.runtime
  timeout = 10

  role = aws_iam_role.get-user-details-role.arn

  layers = [aws_lambda_layer_version.lambda_layer.id]

  environment {
    variables = {
      userpoolId = var.userpool_id,
      region =  var.region
    }
  }
}

resource "aws_lambda_function" "delete-user" {
  function_name = "${var.prefix}-delete-user-${var.stage}"

  # The zip containing the lambda function
  filename    = "../../../lambda/dist/functions/delete-user.zip"
  source_code_hash = filebase64sha256("../../../lambda/dist/functions/delete-user.zip")

  # "index" is the filename within the zip file (index.js) and "handler"
  # is the name of the property under which the handler function was
  # exported in that file.
  handler = "index.handler"
  runtime = var.runtime
  timeout = 10

  role = aws_iam_role.delete-user-role.arn

  layers = [aws_lambda_layer_version.lambda_layer.id]

  environment {
    variables = {
      userpoolId = var.userpool_id,
      region =  var.region
    }
  }
}

resource "aws_lambda_function" "list-user-auth-events" {
  function_name = "${var.prefix}-list-user-auth-events-${var.stage}"

  # The zip containing the lambda function
  filename    = "../../../lambda/dist/functions/list-user-auth-events.zip"
  source_code_hash = filebase64sha256("../../../lambda/dist/functions/list-user-auth-events.zip")

  # "index" is the filename within the zip file (index.js) and "handler"
  # is the name of the property under which the handler function was
  # exported in that file.
  handler = "index.handler"
  runtime = var.runtime
  timeout = 10

  role = aws_iam_role.list-user-auth-events-role.arn

  layers = [aws_lambda_layer_version.lambda_layer.id]

  environment {
    variables = {
      userpoolId = var.userpool_id,
      region =  var.region
    }
  }
}

resource "aws_lambda_function" "change-user-status" {
  function_name = "${var.prefix}-change-user-status-${var.stage}"

  # The zip containing the lambda function
  filename    = "../../../lambda/dist/functions/change-user-status.zip"
  source_code_hash = filebase64sha256("../../../lambda/dist/functions/change-user-status.zip")

  # "index" is the filename within the zip file (index.js) and "handler"
  # is the name of the property under which the handler function was
  # exported in that file.
  handler = "index.handler"
  runtime = var.runtime
  timeout = 10

  role = aws_iam_role.change-user-status-role.arn

  layers = [aws_lambda_layer_version.lambda_layer.id]

  environment {
    variables = {
      userpoolId = var.userpool_id,
      region =  var.region
    }
  }
}

resource "aws_lambda_function" "get-groups" {
  function_name = "${var.prefix}-get-groups-${var.stage}"

  # The zip containing the lambda function
  filename    = "../../../lambda/dist/functions/get-groups.zip"
  source_code_hash = filebase64sha256("../../../lambda/dist/functions/get-groups.zip")

  # "index" is the filename within the zip file (index.js) and "handler"
  # is the name of the property under which the handler function was
  # exported in that file.
  handler = "index.handler"
  runtime = var.runtime
  timeout = 10

  role = aws_iam_role.get-groups-role.arn

  layers = [aws_lambda_layer_version.lambda_layer.id]

  environment {
    variables = {
      userpoolId = var.userpool_id,
      region =  var.region
    }
  }
}

resource "aws_lambda_function" "create-group" {
  function_name = "${var.prefix}-create-group-${var.stage}"

  # The zip containing the lambda function
  filename    = "../../../lambda/dist/functions/create-group.zip"
  source_code_hash = filebase64sha256("../../../lambda/dist/functions/create-group.zip")

  # "index" is the filename within the zip file (index.js) and "handler"
  # is the name of the property under which the handler function was
  # exported in that file.
  handler = "index.handler"
  runtime = var.runtime
  timeout = 10

  role = aws_iam_role.create-group-role.arn

  layers = [aws_lambda_layer_version.lambda_layer.id]

  environment {
    variables = {
      userpoolId = var.userpool_id,
      region = var.region
    }
  }
}

resource "aws_lambda_function" "get-group-details" {
  function_name = "${var.prefix}-get-group-details-${var.stage}"

  # The zip containing the lambda function
  filename    = "../../../lambda/dist/functions/get-group-details.zip"
  source_code_hash = filebase64sha256("../../../lambda/dist/functions/get-group-details.zip")

  # "index" is the filename within the zip file (index.js) and "handler"
  # is the name of the property under which the handler function was
  # exported in that file.
  handler = "index.handler"
  runtime = var.runtime
  timeout = 10

  role = aws_iam_role.get-group-details-role.arn

  layers = [aws_lambda_layer_version.lambda_layer.id]

  environment {
    variables = {
      userpoolId = var.userpool_id,
      region = var.region
    }
  }
}

resource "aws_lambda_function" "delete-group" {
  function_name = "${var.prefix}-delete-group-${var.stage}"

  # The zip containing the lambda function
  filename    = "../../../lambda/dist/functions/delete-group.zip"
  source_code_hash = filebase64sha256("../../../lambda/dist/functions/delete-group.zip")

  # "index" is the filename within the zip file (index.js) and "handler"
  # is the name of the property under which the handler function was
  # exported in that file.
  handler = "index.handler"
  runtime = var.runtime
  timeout = 10

  role = aws_iam_role.delete-group-role.arn

  layers = [aws_lambda_layer_version.lambda_layer.id]

  environment {
    variables = {
      userpoolId = var.userpool_id,
      region = var.region
    }
  }
}

resource "aws_lambda_function" "add-to-group" {
  function_name = "${var.prefix}-add-to-group-${var.stage}"

  # The zip containing the lambda function
  filename    = "../../../lambda/dist/functions/add-to-group.zip"
  source_code_hash = filebase64sha256("../../../lambda/dist/functions/add-to-group.zip")

  # "index" is the filename within the zip file (index.js) and "handler"
  # is the name of the property under which the handler function was
  # exported in that file.
  handler = "index.handler"
  runtime = var.runtime
  timeout = 10

  role = aws_iam_role.add-to-group-role.arn

  layers = [aws_lambda_layer_version.lambda_layer.id]

  environment {
    variables = {
      userpoolId = var.userpool_id,
      region = var.region
    }
  }
}


resource "aws_lambda_function" "remove-from-group" {
  function_name = "${var.prefix}-remove-from-group-${var.stage}"

  # The zip containing the lambda function
  filename    = "../../../lambda/dist/functions/remove-from-group.zip"
  source_code_hash = filebase64sha256("../../../lambda/dist/functions/remove-from-group.zip")

  # "index" is the filename within the zip file (index.js) and "handler"
  # is the name of the property under which the handler function was
  # exported in that file.
  handler = "index.handler"
  runtime = var.runtime
  timeout = 10

  role = aws_iam_role.remove-from-group-role.arn

  layers = [aws_lambda_layer_version.lambda_layer.id]

  environment {
    variables = {
      userpoolId = var.userpool_id,
      region =  var.region
    }
  }
}
