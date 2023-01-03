output "vpc_id" {
    value = "${aws_default_vpc.capstone_vpc.id}"
}

output "cap_subnets" {
    value = ["${aws_default_subnet.capstone_subnet_a.id}", "${aws_default_subnet.capstone_subnet_b.id}", "${aws_default_subnet.capstone_subnet_c.id}"]
}