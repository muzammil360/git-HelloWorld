provider "aws" {
  region = "us-east-1"
}


locals {
  cluster_name = "gitlab-runner"
}


# Filter out local zones, which are not currently supported 
# with managed node groups
data "aws_availability_zones" "available" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}