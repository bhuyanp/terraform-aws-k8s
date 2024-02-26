## Getting availability zones
data "aws_availability_zones" "available" {
  state = "available"
}

# Create a Public Subnet AZ1
resource "aws_subnet" "tfvpc-pubsubnet-az1" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "${var.app-prefix}-pubsubnet-az1"
    App  = var.app-name
  }
}

# Create a Public Subnet AZ1
resource "aws_subnet" "tfvpc-pubsubnet-az2" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "${var.app-prefix}-pubsubnet-az2"
    App  = var.app-name
  }
}

# Create a Private Subnet in AZ1
resource "aws_subnet" "tfvpc-pvtsubnet-app-az1" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "${var.app-prefix}-pvtsubnet-app-az1"
    App  = var.app-name
  }
}

# Create a Private Subnet in AZ2
resource "aws_subnet" "tfvpc-pvtsubnet-app-az2" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "${var.app-prefix}-pvtsubnet-app-az2"
    App  = var.app-name
  }
}