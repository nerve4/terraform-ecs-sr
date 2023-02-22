# -----------------------------------------------
# Outputs for ECS-SR
# -----------------------------------------------
output "acp_test_autoscaling_group_arn" {
  description = "The ARN for this AutoScaling Grou"
  value       = module.autoscaling.autoscaling_group_arn
}
