output "lb_dns_name" {
  value       = "${aws_alb.application_load_balancer.dns_name}"
  description = "The domain name of the load balancer"
}
