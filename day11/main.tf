resource "aws_instance" "name" {

    ami = "ami-03753afda9b8ba740"
    instance_type = "t2.small"
    key_name = "pavan"
    tags = {
      name = "server1"
    }
  

}