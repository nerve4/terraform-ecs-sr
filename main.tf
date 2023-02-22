# -----------------------------------------------
# Locals for ECS-SR
# -----------------------------------------------
locals {
  name = "ecs-ex-${replace(basename(path.cwd), "_", "-")}"

  user_data = <<-EOT
    #!/bin/bash
    cat <<'EOF' >> /etc/ecs/ecs.config
    ECS_CLUSTER=${local.name}
    ECS_LOGLEVEL=debug
    EOF
  EOT

}
# -----------------------------------------------
# AutoScaling for ECS-SR
# -----------------------------------------------
data "aws_ssm_parameter" "ecs_optimized_ami" {
  name = "/aws/service/ecs/optimized-ami/amazon-linux-2/recommended"
}

module "autoscaling" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 6.7.0"

  name = "${local.name}-acp-test"

  image_id      = jsondecode(data.aws_ssm_parameter.ecs_optimized_ami.value)["image_id"]
  instance_type = var.acp_test_instance_type

  security_groups                 = [module.autoscaling_sg.security_group_id]
  user_data                       = base64encode(local.user_data)
  ignore_desired_capacity_changes = true

  create_iam_instance_profile = true
  iam_role_name               = local.name
  iam_role_description        = "ECS role for ${local.name}"
  iam_role_policies = {
    AmazonEC2ContainerServiceforEC2Role = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
    AmazonSSMManagedInstanceCore        = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }

  vpc_zone_identifier = var.ecs_private_subnets
  health_check_type   = var.ecs_sr_hc_type
  min_size            = var.ecs_sr_min
  max_size            = var.ecs_sr_max
  desired_capacity    = var.ecs_sr_dcapacity

  autoscaling_group_tags = {
    AmazonECSManaged = true
  }

  protect_from_scale_in = var.ecs_sr_protect_from_scale_in

  tags = var.tags
}

module "autoscaling_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.17.0"

  name        = local.name
  description = "Autoscaling group security group"
  vpc_id      = var.ecs_vpc_id

  ingress_cidr_blocks = var.ecs_sg_ingress_cidr_blocks
  ingress_rules       = var.ecs_sg_ingress_rules

  egress_rules = var.ecs_sg_egress_rules

  tags = var.tags
}
