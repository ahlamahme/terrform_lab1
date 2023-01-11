resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.ahlamvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}
resource "aws_route_table_association" "public_rt_asso" {
  subnet_id      = aws_subnet.ahlamsubnet.id
  route_table_id = aws_route_table.public_rt.id
}