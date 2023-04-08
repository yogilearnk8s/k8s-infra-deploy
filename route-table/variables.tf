variable "private-subnet-cidr" {
 description = "Update the CIDR block ranges for private subnets"
 default = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
 type = list
 
}

variable "public-subnet-cidr" {
 description = "Update the CIDR block ranges for private subnets"
 default = ["10.0.4.0/24","10.0.5.0/24","10.0.6.0/24"]
 type = list
}

