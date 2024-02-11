resource "aws_instance" "webserver" {
  ami           = data.aws_ami.latest_amazon_linux.id # Amazon Linux 2 AMI ID
  instance_type = "t2.micro"

  tags = {
    Name    = "mywebserver"
    Project = "p.2"
  }
  iam_instance_profile = aws_iam_instance_profile.webserver_profile_p2.name
  security_groups      = [aws_security_group.webserver_sg_p2.name]
  user_data            = <<-EOF
              #!/bin/bash
              yum update -y
              yum install httpd -y
              systemctl start httpd
              systemctl enable httpd
              EOF
}