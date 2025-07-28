resource "aws_subnet" "public" {
  count             = length(var.PUBLIC_SUBNETS)
  cidr_block        = var.PUBLIC_SUBNETS[count.index]
  availability_zone = var.AZS[count.index]
  vpc_id            = aws_vpc.vpc.id

  tags = {
    name = "public_subnet"
  }

}

resource "aws_subnet" "private" {
  count             = length(var.PRIVATE_SUBNETS)
  cidr_block        = var.PRIVATE_SUBNETS[count.index]
  availability_zone = var.AZS[count.index]
  vpc_id            = aws_vpc.vpc.id

  tags = {
    name = "private_subnet"
  }
}


resource "aws_subnet" "Db" {
  count             = length(var.DB_SUBNETS)
  cidr_block        = var.DB_SUBNETS[count.index]
  availability_zone = var.AZS[count.index]
  vpc_id            = aws_vpc.vpc.id

  tags = {
    name = "db_subnet"
  }
}





