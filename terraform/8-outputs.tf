output "region" {
  value = var.region
}
output "resource-prefix" {
  value = var.app-prefix
}
output "application-name" {
  value = var.app-name
}
output "deployed-to-az" {
  value = "${data.aws_availability_zones.available.names[0]},${data.aws_availability_zones.available.names[1]}"
}

# output "ecr-product-service" {
#   value = try(data.aws_ecr_repository.ps.repository_url,"")
# }



