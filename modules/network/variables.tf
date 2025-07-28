variable "VPC_CIDR" {
  type = string
}
variable "AZS" {
  type = list(any)
}

variable "PUBLIC_SUBNETS" {
  type = list(any)
}

variable "PRIVATE_SUBNETS" {
  type = list(any)
}

variable "DB_SUBNETS" {
  type = list(any)
}





