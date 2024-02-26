resource "aws_ecr_repository" "product-service" {
  name                 = "product-service"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "${var.app-prefix}-tfvpc-pvtrt-az2"
    App  = var.app-name
  }
}