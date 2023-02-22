# -----------------------------------------------
# Versions for ECS
# -----------------------------------------------
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.70.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 1.2"
    }
  }
  required_version = ">= 0.13.0"
}
