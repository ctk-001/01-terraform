provider "local" {
  region = "ap-northeast-2"

}

variable "user_names" {
  description = "Create IAM users with these names"
  type        = list(string)
  default			= ["aws05-neo", "aws05-trinity", "aws05-morpheus"] 
  
}

output "for_directive" {
  value = <<E0F
		%{~ for name in var.user_names }
			${name}
		%{~ endfor }
			E0F

}
