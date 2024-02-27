resource "aws_ecr_repository" "product-service-image" {
  name                 = "${var.app-prefix}-product-service"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "${var.app-prefix}-product-service"
    App  = var.app-name
  }
}

