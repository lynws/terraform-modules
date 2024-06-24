variable "instance_type" {
  description = "The instance type to use for the instance"
  default     = "t2.micro"
}
variable "access_token_secret" {
  type        = string
  description = "Name of the Secret"
}
variable "dockerhub_username" {
  type        = string
  description = "DockerHub Username"
}
variable "image_name" {
  type        = string
  description = "Image Name"
  default     = "qed"
}
variable "tag" {
  type        = string
  description = "Tag ID"
}