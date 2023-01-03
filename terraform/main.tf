module "network" {
  source = ".//modules/network"
}

module "app_load_balancer" {
  source        = ".//modules/app_load_balancer"
  lb_name       = "capstone-lb"
  subnets       = module.network.cap_subnets
  tg_name       = "capstone-tg"
  tg_port       = 80
  vpc_id        = module.network.vpc_id
  listener_port = 80
  # Security Group
  ingress_from_port = 80
  ingress_to_port   = 80
}

module "ecs" {
  source            = ".//modules/ecs"
  container_count   = 5
  container_port    = 80
  memory            = 512
  cpu               = 256
  target_group_arn  = module.app_load_balancer.target_group_arn
  lb_security_group = module.app_load_balancer.sg_id
  subnets           = module.network.cap_subnets
}