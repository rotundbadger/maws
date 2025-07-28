resource "aws_eip" "eip" {
  count = var.EIP_COUNT
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "main"

  }
}

resource "aws_nat_gateway" "nat" {

  count = var.EIP_COUNT

  allocation_id = aws_eip.eip[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

}
