variable "bucket_name" {
  description = "The name of the S3 bucket. Must be globally unique."
  type        = string
  default     = "aws05-terraform-state"

}

variable "table_name" {
  description = "The name of DynamoDB table. Must be unique in this AWS account."
  type        = string
  default     = "aws05-terraform-locks"
}