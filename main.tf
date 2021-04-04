provider "aws" {
  region  = "eu-west-2" # Setting my region to London. Use your own region here
}

resource "aws_ecr_repository" "my_first_ecr_repo" {
  name = "sample-ecr-repo" # Naming my repository
}

resource "aws_ecs_cluster" "my_cluster" {
  name = "sample-cluster" # Naming the cluster
}

