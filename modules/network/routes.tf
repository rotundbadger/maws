resource "aws_route_table_association" "priv_assoc" {
  count          = var.EIP_COUNT
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id

}

resource "aws_route_table_association" "db_assoc" {
  count          = var.EIP_COUNT
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.dbs[count.index].id

}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id
  count  = var.EIP_COUNT

  route {
    cidr_block = var.PRIVATE_SUBNETS[count.index]
    gateway_id = aws_nat_gateway.nat[count.index].id

  }
  tags = {
    Name = "private${count.index}"

  }

}

resource "aws_route_table" "dbs" {
  vpc_id = aws_vpc.vpc.id
  count  = var.EIP_COUNT

  route {
    cidr_block = var.DB_SUBNETS[count.index]
    gateway_id = aws_nat_gateway.nat[count.index].id
  }

  tags = {
    Name = "dbs${count.index}"

  }


}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  count  = var.EIP_COUNT

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id

  }

  tags = {
    Name = "public${count.index}"

  }

}
