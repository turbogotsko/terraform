resource "aws_instance" "ec2-tf" {
  ami                    = "ami-026b57f3c383c2eec"
  instance_type          = var.instance-type
  subnet_id              = aws_subnet.tf-public.id
  key_name               = var.ssh-key
  vpc_security_group_ids = [aws_security_group.tf-sg.id]
  user_data              = file("userdata.sh")
  tags                   = merge({ "Name" = "ec2-tf" }, var.tags)
}
