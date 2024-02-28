resource "aws_iam_role" "fs-ng-role" {
  name = "fs-ng-role"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "fs-app-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.fs-ng-role.name
}

resource "aws_iam_role_policy_attachment" "fs-app-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.fs-ng-role.name
}

resource "aws_iam_role_policy_attachment" "fs-app-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.fs-ng-role.name
}

resource "aws_eks_node_group" "fs-app-cluster-ng" {
  cluster_name    = aws_eks_cluster.fs-app-cluster.name
  node_group_name = "fs-app-cluster-ng"
  node_role_arn   = aws_iam_role.fs-ng-role.arn
  subnet_ids      = [aws_subnet.tfvpc-pvtsubnet-app-az1.id,aws_subnet.tfvpc-pvtsubnet-app-az2.id]
  instance_types = ["t2.micro"]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  tags = {
    Name = "${var.app-prefix}-cluster-ng"
    App  = var.app-name
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.fs-app-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.fs-app-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.fs-app-AmazonEC2ContainerRegistryReadOnly,
  ]
}