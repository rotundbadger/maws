resource "aws_vpc" "vpc" {
  cidr_block = var.VPC_CIDR
  tags = {
    name = "vpc"
  }

}
