# Public Security Group
resource "aws_security_group" "pub-ec2-sg" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.app-prefix}-pub-ec2-sg"
    App  = var.app-name
  }
}
# Security Group Inbound Rule
resource "aws_vpc_security_group_ingress_rule" "pub-ec2-sg-ingree" {
  security_group_id = aws_security_group.pub-ec2-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
# Security Group Outbound Rule
resource "aws_vpc_security_group_egress_rule" "pub-ec2-sg-egree" {
  security_group_id = aws_security_group.pub-ec2-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "All"
}
