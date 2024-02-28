resource "aws_ecr_repository" "service-images" {
  for_each = toset(var.services)
  name                 = "${var.app-prefix}-${each.key}-service"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Name = "${var.app-prefix}-${each.key}-service"
    App  = var.app-name
  }
}

