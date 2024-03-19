resource "aws_iam_role" "ordering_system_ecs_role" {
  name = "OrderingSystemServiceRoleForECS"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "ecs.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "admin_access_attachment" {
  name       = "AdministratorAccessAttachment"
  roles      = [aws_iam_role.ordering_system_ecs_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_policy" "ecs_policy" {
  name        = "OrderingSystemServiceRoleForECSPolicy"
  description = "Policy for Ordering System ECS Role"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "ecr:GetAuthorizationToken",
          "ecr:BatchGetImage",
          "ecr:GetDownloadUrlForLayer"
        ],
        "Resource" : [
          "arn:aws:ecr:us-east-1:637423186279:repository/ordering-system-prod"
        ]
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "ecs_policy_attachment" {
  name       = "OrderingSystemServiceRoleForECSAttachment"
  roles      = [aws_iam_role.ordering_system_ecs_role.name]
  policy_arn = aws_iam_policy.ecs_policy.arn
}