
# Public Routing table for the VPC
# Single route table can be attached to multiple public subnet
resource "aws_route_table" "tfvpc-pubrt" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
  tags = {
    Name = "${var.app-prefix}-tfvpc-pubrt"
    App  = var.app-name
  }
}
resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.tfvpc-pubsubnet-az1.id
  route_table_id = aws_route_table.tfvpc-pubrt.id
}
resource "aws_route_table_association" "rta2" {
  subnet_id      = aws_subnet.tfvpc-pubsubnet-az2.id
  route_table_id = aws_route_table.tfvpc-pubrt.id
}


# Private Routing table for the VPC
resource "aws_route_table" "tfvpc-pvtrt-az1" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ng-az1.id
  }
  tags = {
    Name = "${var.app-prefix}-tfvpc-pvtrt-az1"
    App  = var.app-name
  }
}
# Private Routing table for the VPC
resource "aws_route_table" "tfvpc-pvtrt-az2" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ng-az2.id
  }
  tags = {
    Name = "${var.app-prefix}-tfvpc-pvtrt-az2"
    App  = var.app-name
  }
}
resource "aws_route_table_association" "pvt-az1" {
  subnet_id      = aws_subnet.tfvpc-pvtsubnet-app-az1.id
  route_table_id = aws_route_table.tfvpc-pvtrt-az1.id
}
resource "aws_route_table_association" "pvt-az2" {
  subnet_id      = aws_subnet.tfvpc-pvtsubnet-app-az2.id
  route_table_id = aws_route_table.tfvpc-pvtrt-az2.id
}