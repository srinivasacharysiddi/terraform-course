resource "aws_key_pair" "dev" {
  key_name = "dev-key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}
resource "aws_instance" "web" {
  ami           = var.AMI[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name      = aws_key_pair.dev-key.key_name

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh",
    ]
  }

  connection {
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    host        = coalesce(self.public_ip, self.private_ip)
    private_key = file(var.PATH_TO_PRIVATE_KEY)

  }
}
