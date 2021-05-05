resource "aws_api_gateway_rest_api" "users-api" {
  name        = "${var.prefix}-users-api-${var.stage}"
  description = "${var.prefix}-users-api-${var.stage}"
  body = file("../../../swagger/${var.stage}/swagger.yaml")
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_deployment" "users-api" {
  rest_api_id = aws_api_gateway_rest_api.users-api.id
  stage_name  = var.stage

  stage_description = md5(file("../../../swagger/${var.stage}/swagger.yaml"))

  depends_on = [aws_api_gateway_rest_api.users-api]

  lifecycle {
    create_before_destroy = true
  }
}

#
# Uncomment resource if API Gateway custom domain exists
#
//resource "aws_api_gateway_base_path_mapping" "courses_api_mapping" {
//  api_id      = aws_api_gateway_rest_api.users-api.id
//  stage_name  = var.stage
//  domain_name = var.api_domain
//  base_path   = "users"
//}

