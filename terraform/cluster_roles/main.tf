terraform {
  required_version = "=1.4.3"
  required_providers {
    aws = {
      version = "~> 4.63.0"
      source  = "hashicorp/aws"
    }
  }
}

resource "aws_iam_role" "alb_role" {
  count = var.create_roles ? 1 : 0
  name  = "alb-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = var.eks_oidc_provider_arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition : {
          StringEquals : {
            "${var.eks_oidc_issuer_url}:aud" : "sts.amazonaws.com"
            "${var.eks_oidc_issuer_url}:sub" : "system:serviceaccount:alb:aws-load-balancer-controller"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "alb_policy" {
  count  = var.create_roles ? 1 : 0
  role   = aws_iam_role.alb_role[0].id
  policy = var.use_us_gov_cloud_arns ? file("${path.module}/policies/aws-lb-controller-gov.json") : file("${path.module}/policies/aws-lb-controller.json")

}

resource "aws_iam_role" "image_updater_role" {
  count = var.create_roles ? 1 : 0
  name  = "image-updater-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = var.eks_oidc_provider_arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition : {
          StringEquals : {
            "${var.eks_oidc_issuer_url}:aud" : "sts.amazonaws.com"
            "${var.eks_oidc_issuer_url}:sub" : "system:serviceaccount:argocd:argocd-image-updater"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role" "ebs_csi_driver_role" {
  count = var.create_roles ? 1 : 0
  name  = "ebs-csi-driver"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = var.eks_oidc_provider_arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition : {
          StringEquals : {
            "${var.eks_oidc_issuer_url}:aud" : "sts.amazonaws.com"
            "${var.eks_oidc_issuer_url}:sub" : "system:serviceaccount:kube-system:ebs-csi-driver"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "ebs_csi_driver_policy" {
  count  = var.create_roles ? 1 : 0
  role   = aws_iam_role.ebs_csi_driver_role[0].id
  policy = var.use_us_gov_cloud_arns ? file("${path.module}/policies/ebs-csi-driver-gov.json") : file("${path.module}/policies/ebs-csi-driver.json")
}

resource "aws_iam_role" "autoscaler_role" {
  count = var.create_roles && var.create_autoscaler_role ? 1 : 0
  name  = "autoscaler-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = var.eks_oidc_provider_arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition : {
          StringEquals : {
            "${var.eks_oidc_issuer_url}:aud" : "sts.amazonaws.com"
            "${var.eks_oidc_issuer_url}:sub" : "system:serviceaccount:kube-system:cluster-autoscaler"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "autoscaler_policy" {
  count  = var.create_roles && var.create_autoscaler_role ? 1 : 0
  role   = aws_iam_role.autoscaler_role[0].id
  policy = file("${path.module}/policies/autoscaler.json")
}

resource "aws_iam_role" "fluent_bit_role" {
  count = var.create_roles && var.create_fluent_bit_role ? 1 : 0
  name  = "fluent-bit-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = var.eks_oidc_provider_arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition : {
          StringEquals : {
            "${var.eks_oidc_issuer_url}:aud" : "sts.amazonaws.com"
            "${var.eks_oidc_issuer_url}:sub" : "system:serviceaccount:fluent-bit:fluent-bit"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "fluent_bit_policy" {
  count  = var.create_roles && var.create_fluent_bit_role ? 1 : 0
  role   = aws_iam_role.fluent_bit_role[0].id
  policy = file("${path.module}/policies/fluent-bit.json")
}
