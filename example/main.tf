provider "aws" {
    region = "ap-northeast-1"
}

locals {
    example_instance_type = "t3.micro"
}

module "web_server" {
    source = "./http_server"
    instance_type = "t3.micro"
}

output "public_dns" {
    value = module.web_server.public_dns
}


