resource "aws_instance" "example" {
    ami           = "${lookup(var.AMI, var.AWS_REGION)}"
    instance_type = "t2.micro"
}