resource "aws_apigatewayv2_api" "resume" {
  name          = "cloud-resume-api"
  protocol_type = "HTTP"

  cors_configuration {
    allow_origins = [
    "https://${var.domain_name}"]

    allow_methods = [
    "GET"]

    allow_headers = [
    "content-type"]
  }
}
resource "aws_lambda_permission" "api_gateway" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFucntion"
  function_name = aws_lambda_function.visitor_counter.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.resume.execution_arn}/*/*"
}
