data "aws_ip_ranges" "us_ec2" {
  regions  = ["us-east-1"]
  services = ["ec2"]
}

resource "aws_security_group" "my_ec2" {
  name = "my_ec2"
  
  ingress {
  from_port        = "443"
  to_port          = "443"
  protocol         = "tcp"
  cidr_blocks      = ["${data.aws_ip_ranges.us_ec2.cidr_blocks}"]
  ipv6_cidr_blocks = ["${data.aws_ip_ranges.us_ec2.ipv6_cidr_blocks}"]
  }

  tags = {
    CreateDate = "${data.aws_ip_ranges.us_ec2.create_date}"
    SyncToken  = "${data.aws_ip_ranges.us_ec2.sync_token}"
  }
}


