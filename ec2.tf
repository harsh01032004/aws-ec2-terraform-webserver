data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"]

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

resource "aws_instance" "web" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web.id]

  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y apache2
    echo "<h1>Capstone Project 1 - Harsh</h1>" > /var/www/html/index.html
    systemctl enable --now apache2
  EOF

  tags = { Name = "capstone-web-server" }
}

output "public_ip" {
  value = aws_instance.web.public_ip
}

