variable "region" {
  default = "us-east-1"
}
variable "app-name" {
  default = "AWS Fullstack App"
}
variable "app-prefix" {
  default = "fs-app"
}

variable "services" {
  type = list(string)
  default = ["customer","product"]
}
