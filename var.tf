variable "aws_region" {
  description = "The AWS Region to deploy the cluster into"
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name prefix for resources"
  default     = "eks-platform"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}


variable "cluster_version" {
  description = "Kubernetes version for the EKS Cluster"
  default     = "1.29"
}
variable "environment" {
  description = "Deployment environment (prod or dev)"
  default     = "dev"
}

variable "instance_type_map" {
  description = "Map of instance types by environment"
  default = {
    prod = "t3.medium"
    dev  = "t3.micro"
  }
}


variable "principal_arn" {
  description = "IAM Principal ARN to grant cluster access"
  default     = "arn:aws:iam::344809605543:root"
}
