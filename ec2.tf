resource "aws_instance" "web" {
  ami = "ami-09d56f8956ab235b3"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id = aws_subnet.ahlamsubnet.id
  security_groups = [aws_security_group.sg.id]

  user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing apache2"
  sudo apt update -y
  sudo apt install apache2 -y
  echo "*** Completed Installing apache2"
  EOF

}