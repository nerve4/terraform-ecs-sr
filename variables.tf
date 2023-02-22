# -----------------------------------------------
# Variables for ECS-SR
# -----------------------------------------------
variable "acp_test_instance_type" {
  type        = string
  description = "The type of instance of asg-acp-test."
}

variable "ecs_private_subnets" {
  type        = list(string)
  description = "The list of private subnets"
}

variable "ecs_sr_hc_type" {
  type        = string
  description = "EC2 or ELB. Controls how health checking is done."
}

variable "ecs_sr_min" {
  type        = number
  description = "The minimum size of the autoscale group."
}

variable "ecs_sr_max" {
  type        = number
  description = " The maximum size of the autoscale group."
}

variable "ecs_sr_dcapacity" {
  type        = number
  description = "The number of Amazon EC2 instances that should be running in the group."
}

variable "ecs_sr_protect_from_scale_in" {
  type        = bool
  description = "The autoscaling group will not select instances with this setting for termination during scale in events."
}

variable "ecs_vpc_id" {
  type        = string
  description = "The ECS VPC ID."
}

variable "ecs_sg_ingress_cidr_blocks" {
  type        = list(string)
  description = "List of IPv4 CIDR ranges to use on all ingress rules."
}

variable "ecs_sg_ingress_rules" {
  type        = list(string)
  description = "List of ingress rules to create by name."
}

variable "ecs_sg_egress_rules" {
  type        = list(string)
  description = "List of egress rules to create by name."
}

variable "tags" {
  type        = map(string)
  description = "Tags assigned to the created resources."
}
