resource "aws_instance" "name" {

    ami = "ami-0aebec83a182ea7ea"

    instance_type = "t2.small"
    key_name = "pavan"
    tags = {
      name = "server1"
    }
  

}