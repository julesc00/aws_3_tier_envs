# Create vpc
resource "aws_vpc" "vpc" {
  cidr_block = ""
  instance_tenancy = "default"
    enable_dns_support = true

  tags = {
    Name = "${var.vpc_name}-vpc"
  }
}

# Create Internet Gateway and attach to VPC
resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = "${aws_vpc.vpc.id}"

    tags = {
        Name = "${var.vpc_name}-igw"
    }
}

# Use data source to get available zones in the region
data "aws_availability_zones" "available" {}

# Create public subnets az1
resource "aws_subnet" "public_subnet_az1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = ""
  availability_zone = ""
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-public-subnet-az1"
  }
}

# Create public subnets az2
resource "aws_subnet" "public_subnet_az2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = ""
  availability_zone = ""
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-public-subnet-az2"
  }
}

# Create route table and add public route
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = ""
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "${var.vpc_name}-public-route-table"
  }
}

# Associate public subnet az1 with public route table
resource "aws_route_table_association" "public_subnet_az1_association" {
  subnet_id = ""
  route_table_id = ""
}

# Associate public subnet az2 with public route table
resource "aws_route_table_association" "public_subnet_az2_association" {
  subnet_id = ""
  route_table_id = ""
}

# Create private app subnets az1
resource "aws_subnet" "private_subnet_az1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = ""
  availability_zone = ""

  tags = {
    Name = "${var.vpc_name}-private-subnet-az1"
  }
}

# Create private app subnets az2

resource "aws_subnet" "private_subnet_az2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = ""
  availability_zone = ""

  tags = {
    Name = "${var.vpc_name}-private-subnet-az2"
  }
}

# Create private data subnets az1
resource "aws_subnet" "private_data_subnet_az1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = ""
  availability_zone = ""
  map_public_ip_on_launch = false

    tags = {
        Name = "${var.vpc_name}-private-data-subnet-az1"
    }

}

# Create private data subnets az2
resource "aws_subnet" "private_data_subnet_az2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = ""
  availability_zone = ""
  map_public_ip_on_launch = false

    tags = {
        Name = "${var.vpc_name}-private-data-subnet-az2"
    }

}