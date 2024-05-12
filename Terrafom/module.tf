module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-cluster"
  cluster_version = "1.21"
  subnets         = [aws_subnet.my_subnet.id]
  vpc_id          = aws_vpc.my_vpc.id
  node_groups = {
    eks_workers = {
      desired_capacity = 2
      max_capacity     = 2
      min_capacity     = 1
      instance_type    = "t3.medium"
    }
  }
}
