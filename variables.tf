/**************************************************
****************AZURE VARIABLES*******************
**************************************************/
variable "az_location" {
    type = string
    default = "francecentral"
}

variable "az_project" {
    type = string
    default     = "ARI"
}

variable "ssh_username" {
    type = string
}

variable "ssh_public_key" {
    type =  string
}

variable "az_ssh_allowed_ip" {
    description = "ip address allowed to ssh in the vm"
    type = string
}

variable "az_vm_size" {
    description = "size of the vm to deploy"
    default     = "Standard_B1s"
}

variable "az_image_data_disk_size" {
  description = "size of the data disk image in gb"
  default     = "85"
}
/*************************************************
*************END AZURE VARIABLES******************
**************************************************/
