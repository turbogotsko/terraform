#------------ SECURITY GROUPS ---------------#
resource "aws_security_group" "tf-sg" {
  name        = "tf-sg"
  vpc_id      = aws_vpc.tf-vpc.id
  description = "SSH, HTTP & HTTPS accessible"

  tags = {
    "Name"      = "allow ssh, http & https"
    "ManagedBy" = "terraform"
  }
}
# SG RULES
resource "aws_security_group_rule" "sg-rule-SSH" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tf-sg.id
}
resource "aws_security_group_rule" "sg-rule-HTTP" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tf-sg.id
}
resource "aws_security_group_rule" "sg-rule-HTTPS" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tf-sg.id
}
resource "aws_security_group_rule" "public-out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tf-sg.id
}