##----- EC2 ---------
variable "ssh-key" {
  default     = "key-for-server"
  description = "key for ssh into ec2 instance"
}
variable "instance-type" {
  type    = string
  default = "t2.micro"
}

variable "port" {
  type    = number
  default = 0
}
variable "tags" {
  default = {
    "Author"    = "Sergio"
    "ManagedBy" = "Terraform"
  }
}
##---- vpc vars -----
variable "vpc-cidr" {
  type    = string
  default = "171.10.0.0/16"
}
variable "sub-cidr-pub" {
  type    = string
  default = "171.10.1.0/24"
}
variable "sub-cidr-priv" {
  type    = string
  default = "171.10.2.0/24"
}
variable "cidr-all-ips" {
  type    = string
  default = "0.0.0.0/0"
}
variable "sub-az-priv" {
  type    = string
  default = "us-east-1b"
}
variable "sub-az-pub" {
  type    = string
  default = "us-east-1a"
}