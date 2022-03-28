resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "talent-academy-igw"
  }
}
resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.nat_eip.id
  connectivity_type = "public"
  subnet_id = aws_subnet.public.id

  tags = {
    Name = "talent-academy-natgw"
  }
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_eip" "nat_eip" {
  vpc = true
}