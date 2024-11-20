resource "aws_instance" "name" {


    ami = var.ami
    instance_type = var.inttype
    key_name = var.key
    tags = {
      name = var.name
    }
}