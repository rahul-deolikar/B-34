ami_id           = "ami-01b799c439fd5516a"
instance_type     = "t2.micro"
key_name          = "B-34"
instance_name     = "server-1"
vpc_cidr_block    = "10.0.0.0/16"
vpc_name          = "vpc-1"
subnet_cidr_block = "10.0.0.0/24"
subnet_az         = "us-east-1a"
public_ip         = "true"
subnet_name       = "subnet-public"
igw_name          = "igw-new"
ports             = [22, 80, 0]
