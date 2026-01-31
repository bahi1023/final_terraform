terraform {
  required_version = ">= 1.14.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "> 2.23"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "> 2.11"
    }
  }
 }
provider "aws" {
  region = "us-east-1"   # Change this to your preferred region (e.g., us-east-1)
}