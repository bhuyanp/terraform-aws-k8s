# Internet Gateway(one per VPC)
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.app-prefix}-vpc-gw"
    App  = var.app-name
  }
}
