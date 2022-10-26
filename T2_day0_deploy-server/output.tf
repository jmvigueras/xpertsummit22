
output "server" {
  value = {
    id  = aws_instance.server.id
    arn = aws_instance.server.arn
    ip  = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.eni-server["ip"]
  }
}