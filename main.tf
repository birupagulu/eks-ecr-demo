provider "aws" {
  region = "ap-southeast-1"
}

data "aws_vpc" "eks-vpc" {
  id = "vpc-06a861a21c385fa27"
}

data "aws_subnet" "private_subnet-1" {
  vpc_id = data.aws_vpc.eks-vpc.id
  availability_zone = "ap-southeast-1a"
}

data "aws_subnet" "private_subnet-2" {
  vpc_id = data.aws_vpc.eks-vpc.id
  availability_zone = "ap-southeast-1b"
}


resource "aws_eks_cluster" "eks_cluster" {
  name     = "gideon-cluster"
  role_arn = "arn:aws:iam::573327415341:role/eks-cluster-role"

  vpc_config {
    subnet_ids = ["data.aws_subnet.private_subnet-1","data.aws_subnet.private_subnet-2"]
  }
}

resource "aws_eks_fargate_profile" "fargate_profile" {
  cluster_name          = aws_eks_cluster.eks_cluster.name
  fargate_profile_name  = "fargate-eks"
  pod_execution_role_arn = "arn:aws:iam::573327415341:role/eks-pod-role"

  selector {
    namespace = "fp-name"
  }
}

resource "aws_eks_addon" "coredns" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  addon_name   = "coredns"
}

data "aws_ecr_repository" "existing_ecr_repository" {
  name = "ecr-eks"
}

output "ecr_repository_url" {
  value = data.aws_ecr_repository.existing_ecr_repository.repository_url
}
