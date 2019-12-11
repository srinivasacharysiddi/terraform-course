variable "AWS_REGION" {
  default = "us-east-1"
}
variable "AMIs" {
  type = "map"
  default = {
    us-east-1 = "ami-"
  }
}

