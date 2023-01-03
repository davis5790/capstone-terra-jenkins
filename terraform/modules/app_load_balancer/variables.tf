# Load Balancer Variables
variable "lb_name" {
    description = "the name of the load balancer"
    default = ""
}

variable "subnets" {
    description = "The subnets used by the load balancer. No defualt, will be defined from network output in main.tf"
}

# Target Group Variables
variable "tg_name" {
    description = "the name of the target group"
    default = ""
}

variable "tg_port" {
    description = "the port used by the target group, No default value, port must be specified in root/main.tf"
}

variable "tg_protocol" {
    description = "the protocol used by the target group"
    default = "HTTP"
}

variable "tg_type" {
    description = "we are targeting IP addresses"
    default = "ip"
}

variable "vpc_id" {
    description = "The VPC ID"
}

# Listener Variables
variable "listener_port" {
    description = "the port of the listener. No default value, port must be specified in root/main.tf"
}

variable "listener_protocol" {
    description = "protocol used by the listener"
    default = "HTTP"
}

variable "listener_action" {
    description = "the action used by the listener"
    default = "forward"
}   

# Security Group Variables
variable "ingress_from_port" {
    description = "beginning of port range allowed inbound by the security group"
}

variable "ingress_to_port" {
    description = "end of the allowed inbound port range"
}

variable "protocol" {
    description = "the internet protocol allowed by the security group"
    default = "tcp"
}

variable "ingress_cidr" {
    description = "IP addresses allowed by the security group"
    default = ["0.0.0.0/0"]
}