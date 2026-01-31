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
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS Cluster"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EKS worker nodes"
  type        = string
}

variable "principal_arn" {
  description = "IAM Principal ARN to grant cluster access"
  type        = string
}

variable "environment" {
  description = "Deployment environment (prod or dev)"
  type        = string
  default = "prod"
}


