provider "aws" {
	region = "ap-northeast-2"
}

data "aws_vpc" "default"{
	default = true

}

data "aws_subnets" "example" {
	filter {
		name ="vpc-id"
		values = [data.aws_vpc.default.id]


	}
}

data "aws_subnet" "example"{
	for_each = toset(data.aws_subnets.example.ids)
	id			 = each.value

}

data "aws_vpc" "project-vpc"{
	id = "vpc-09648b326103bbd03"

}

data "aws_vpc" "project-vpc"{
	filter {
		name = "tag:Name"
		value = ["Project-VPC"]
	}
}


output "vpc-id" {
	value = data.aws_vpc.default.id

}

output "vpc-cidr_block" {
	value = [for s in data.aws_subnet.example : s.cidr_block]

}
