# ECS Task Variables
variable "container_definitions" {
    description = "ECS task container definition"
    default = <<DEFINITION
            [
                {
                "name": "capstone-task",
                "image": "606026656431.dkr.ecr.us-east-1.amazonaws.com/capstone-ecr-repo:latest",
                "essential": true,
                "portMappings": [
                        {
                        "containerPort": 80,
                        "hostPort": 80
                        }
                    ]
                }
            ]
            DEFINITION
}

variable "requires_compatibilities" {
    description = "Fargate or EC2 depending on serverless/customization preferences"
    default = ["FARGATE"]
}

variable "network_mode" {
    description = "Can be 'host', 'bridge', or 'awsvpc'"
    default = "awsvpc"
}

variable "memory" {
    description = "Specifying the memory our container requires"
    default = 512
}

variable "cpu" {
    description = "Specifying the CPU our container requires"
    default = 256
}

# ECS Service Variables
variable "servsice_launch_type" {
    description = "value"
    default = "FARGATE"
}

variable "container_count" {
    description = "The number of containers we want launched"
    default = 3
}

variable "container_port" {
    description = "Specifying the open port of our container"
    default = 80
}

variable "target_group_arn" {
    description = "target group arn"
}

variable "lb_security_group" {
  description = "load balancer security group id"
}

variable "subnets" {
  description = "subnet used by ECS service"
}