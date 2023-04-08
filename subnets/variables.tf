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

variable "private-subnet-names" {
description = "Defining the subnet names"
default = ["private-subnet-1","private-subnet-2","private-subnet-3"]
type = list

}

variable "public-subnet-names" {
description = "Defining the subnet names"
default = ["public-subnet-1","public-subnet-2","public-subnet-3"]
type = list

}
