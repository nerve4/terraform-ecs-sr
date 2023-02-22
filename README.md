# Terraform-ECS-SR

## Summary

Terraform code to create an ECS Cluster Resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.70.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 1.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.70.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_autoscaling"></a> [autoscaling](#module\_autoscaling) | terraform-aws-modules/autoscaling/aws | ~> 6.7.0 |
| <a name="module_autoscaling_sg"></a> [autoscaling\_sg](#module\_autoscaling\_sg) | terraform-aws-modules/security-group/aws | ~> 4.17.0 |

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.ecs_optimized_ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acp_test_instance_type"></a> [acp\_test\_instance\_type](#input\_acp\_test\_instance\_type) | The type of instance of asg-acp-test. | `string` | n/a | yes |
| <a name="input_ecs_private_subnets"></a> [ecs\_private\_subnets](#input\_ecs\_private\_subnets) | The list of private subnets | `list(string)` | n/a | yes |
| <a name="input_ecs_sg_egress_rules"></a> [ecs\_sg\_egress\_rules](#input\_ecs\_sg\_egress\_rules) | List of egress rules to create by name. | `list(string)` | n/a | yes |
| <a name="input_ecs_sg_ingress_cidr_blocks"></a> [ecs\_sg\_ingress\_cidr\_blocks](#input\_ecs\_sg\_ingress\_cidr\_blocks) | List of IPv4 CIDR ranges to use on all ingress rules. | `list(string)` | n/a | yes |
| <a name="input_ecs_sg_ingress_rules"></a> [ecs\_sg\_ingress\_rules](#input\_ecs\_sg\_ingress\_rules) | List of ingress rules to create by name. | `list(string)` | n/a | yes |
| <a name="input_ecs_sr_dcapacity"></a> [ecs\_sr\_dcapacity](#input\_ecs\_sr\_dcapacity) | The number of Amazon EC2 instances that should be running in the group. | `number` | n/a | yes |
| <a name="input_ecs_sr_hc_type"></a> [ecs\_sr\_hc\_type](#input\_ecs\_sr\_hc\_type) | EC2 or ELB. Controls how health checking is done. | `string` | n/a | yes |
| <a name="input_ecs_sr_max"></a> [ecs\_sr\_max](#input\_ecs\_sr\_max) | The maximum size of the autoscale group. | `number` | n/a | yes |
| <a name="input_ecs_sr_min"></a> [ecs\_sr\_min](#input\_ecs\_sr\_min) | The minimum size of the autoscale group. | `number` | n/a | yes |
| <a name="input_ecs_sr_protect_from_scale_in"></a> [ecs\_sr\_protect\_from\_scale\_in](#input\_ecs\_sr\_protect\_from\_scale\_in) | The autoscaling group will not select instances with this setting for termination during scale in events. | `bool` | n/a | yes |
| <a name="input_ecs_vpc_id"></a> [ecs\_vpc\_id](#input\_ecs\_vpc\_id) | The ECS VPC ID. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags assigned to the created resources. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acp_test_autoscaling_group_arn"></a> [acp\_test\_autoscaling\_group\_arn](#output\_acp\_test\_autoscaling\_group\_arn) | The ARN for this AutoScaling Grou |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
