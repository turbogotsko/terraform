#--------- VPCs ---------------#
resource "aws_vpc" "tf-vpc" {
  cidr_block = var.vpc-cidr

  tags = {
    "Name"      = "tf-vpc"
    "ManagedBy" = "terraform"
  }
}
#-------- SUBNETS -------------------#
resource "aws_subnet" "tf-public" {
  vpc_id            = aws_vpc.tf-vpc.id
  cidr_block        = var.sub-cidr-pub
  availability_zone = var.sub-az-pub

  tags = {
    "Name"      = "tf-public-sub"
    "ManagedBy" = "terraform"
  }
}
resource "aws_subnet" "tf-private" {
  vpc_id            = aws_vpc.tf-vpc.id
  cidr_block        = var.sub-cidr-priv
  availability_zone = var.sub-az-priv

  tags = {
    "Name"      = "tf-private-sub"
    "ManagedBy" = "terraform"
  }
}
#------------- GATEWAYS -----------------#
resource "aws_internet_gateway" "tf-igw" {
  vpc_id = aws_vpc.tf-vpc.id

  tags = {
    "Name"      = "tf-igw"
    "ManagedBy" = "terraform"
  }
}
#------------ ROUTE TABLES ---------------#
resource "aws_route_table" "route-public" {
  vpc_id = aws_vpc.tf-vpc.id

  tags = {
    "Name"      = "tf-route-public"
    "ManagedBy" = "terraform"
  }
}
resource "aws_route" "igw-route" {
  route_table_id         = aws_route_table.route-public.id
  destination_cidr_block = var.cidr-all-ips
  gateway_id             = aws_internet_gateway.tf-igw.id
}
# RT ASSOCIATIONS
resource "aws_route_table_association" "assign-route-public" {
  route_table_id = aws_route_table.route-public.id
  subnet_id      = aws_subnet.tf-public.id
}
