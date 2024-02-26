resource "aws_eip" "eip_nat_gateway1" {
}
resource "aws_eip" "eip_nat_gateway2" {
}

# Nat gateway will allow outbound from pvt subset via pub subnet
resource "aws_nat_gateway" "ng-az1" {
  allocation_id = aws_eip.eip_nat_gateway1.id
  subnet_id     = aws_subnet.tfvpc-pubsubnet-az1.id

  tags = {
    Name = "${var.app-prefix}-ng1"
    App  = var.app-name
  }
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.this]
}
# Nat gateway will allow outbound from pvt subset via pub subnet
resource "aws_nat_gateway" "ng-az2" {
  allocation_id = aws_eip.eip_nat_gateway2.id
  subnet_id     = aws_subnet.tfvpc-pubsubnet-az2.id

  tags = {
    Name = "${var.app-prefix}-ng2"
    App  = var.app-name
  }
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.this]
}