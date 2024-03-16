resource "aws_db_subnet_group" "subnet-rds" {
  name       = var.projectName
  subnet_ids = [aws_subnet.subnet1.id, aws_subnet.subnet2.id, aws_subnet.subnet3.id]
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-terraform"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"

  availability_zone = "us-east-1a" # Substitua pela zona de disponibi

  tags = {
    Name = "subnet-terraform-public-1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.2.0/24"

  availability_zone = "us-east-1b" # Substitua pela zona de disponibi

  tags = {
    Name = "subnet-terraform-public-2"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.3.0/24"

  availability_zone = "us-east-1c" # Substitua pela zona de disponibi

  tags = {
    Name = "subnet-terraform-public-3"
  }
}

resource "aws_subnet" "subnet_private_1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.4.0/24"

  availability_zone = "us-east-1d"

  tags = {
    Name = "subnet-terraform-private-1"
  }
}

resource "aws_subnet" "subnet_private_2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.5.0/24"

  availability_zone = "us-east-1e"

  tags = {
    Name = "subnet-terraform-private-2"
  }
}


resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "internet-gateway-terraform"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "route-table-terraform"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_security_group" "security_group" {
  name        = "security_group-terraform"
  description = "Permitir acesso na porta 80"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "security_group-terraform"
  }
}

resource "aws_vpc_security_group_ingress_rule" "security_groups_ipv4" {
  security_group_id = aws_security_group.security_group.id
  cidr_ipv4         = "0.0.0.0/0" # Correção aqui
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}


# Cria um NAT Gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.subnet1.id
}

# Associa um Elastic IP ao NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

# Associa uma rota para o NAT Gateway na tabela de roteamento da subnet privada
resource "aws_route" "private_nat_gateway" {
  route_table_id         = aws_route_table.route_table.id
  destination_cidr_block = "10.0.5.0/24"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}
