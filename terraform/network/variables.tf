variable "location" {
  description = "location of resources"
  default = "west us"
}

variable "tags" {
  description = "tags used for the resources"
  type = "map"
  default = {
      environment = "testing"
  }
}

variable "resource_group_name"{
    description = "resource group name"
    default = "terraformTest"
}

variable "application_port" {
   description = "The port that you want to expose to the external load balancer"
   default     = 80
}

variable "admin_user" {
   description = "User name to use as the admin account on the VMs that will be part of the VM Scale Set"
   default     = "azureuser"
}

variable "admin_password" {
   description = "Default password for admin account"
}