data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecsTaskExecutionRole" {
  name               = "ecsTaskExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "ecsTaskExecutionRole_policy" {
  role       = aws_iam_role.ecsTaskExecutionRole.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_ecs_cluster" "capstone_cluster" {
  name = "capstone-cluster"
}

resource "aws_ecs_task_definition" "capstone_task" {
  family                   = "capstone-task" # Naming our first task
  container_definitions    = var.container_definitions
  requires_compatibilities = var.requires_compatibilities
  network_mode             = var.network_mode
  memory                   = var.memory
  cpu                      = var.cpu
  execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn
}

resource "aws_ecs_service" "capstone_service" {
  name            = "capstone-service"
  cluster         = aws_ecs_cluster.capstone_cluster.id
  task_definition = aws_ecs_task_definition.capstone_task.arn
  launch_type     = var.servsice_launch_type
  desired_count   = var.container_count

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = aws_ecs_task_definition.capstone_task.family
    container_port   = var.container_port
  }

  network_configuration {
    subnets          = var.subnets
    assign_public_ip = true                                                # Providing our containers with public IPs
    security_groups  = ["${aws_security_group.service_security_group.id}"] # Setting the security group
  }
}

# Creating a security group for the ecs service:
resource "aws_security_group" "service_security_group" {
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    # Only allowing traffic in from the load balancer security group
    security_groups = var.lb_security_group
  }

  egress {
    from_port   = 0             # Allowing any incoming port
    to_port     = 0             # Allowing any outgoing port
    protocol    = "-1"          # Allowing any outgoing protocol 
    cidr_blocks = ["0.0.0.0/0"] # Allowing traffic out to all IP addresses
  }
}