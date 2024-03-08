variable "region" {
  default = "us-east-1"
}
variable "app-name" {
  default = "AWS Fullstack App"
}
variable "app-prefix" {
  default = "fs-app"
}


# VPC related variables
variable "azs"{
  type=list(string)
  default = ["us-east-1a", "us-east-1b"]
}
variable "public-subnet-name"{
  type=list(string)
  default = ["fs-app-pub-sub-az1", "fs-app-pub-sub-az2"]
}
variable "private-subnet-name"{
  type=list(string)
  default = ["fs-app-pvt-sub-az1", "fs-app-pvt-sub-az2"]
}
variable "public-subnet-cidr"{
  type=list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "private-subnet-cidr"{
  type=list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "tags" {
  type = map(string)
  default = {
    Application = "AWS Fullstack App"
    Environment = "dev"
    Terraform = "true"
  }
}
