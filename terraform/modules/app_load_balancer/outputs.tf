output "target_group_arn" {
    description = "the arn of the target group"
    value = "${aws_lb_target_group.target_group.arn}"
}

output "sg_id" {
  value = ["${aws_security_group.load_balancer_security_group.id}"]
}