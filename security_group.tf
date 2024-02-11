resource "aws_security_group" "webserver_sg_p2" {
  name        = "webserver-security-group_p2"
  description = "webserver security group with SSH access restricted to a specific IP"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Replace YOUR_IP_ADDRESS with your specific IP address
  }
  # Outbound rule for all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "webserverSecurityGroup_p2"
  }
}