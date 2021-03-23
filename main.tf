
locals {
    az_zones = toset([ "1", "2"])
}

data "azurerm_resource_group" "project_rg" {
    name                    = "jpapazian-${var.az_project}"
}

data "azurerm_image" "templateImage" {
    name = "az-vm-template"
    resource_group_name = data.azurerm_resource_group.project_rg.name
}


module "jpapazian_az_vm" {
    
  source  = "app.terraform.io/jpapazian-org/jpapazian-az-vm/azurerm"
  version = "0.2.2"
    for_each                    = local.az_zones
    m_az_zone                   = each.value
    //m_az_zone                   = "2"
    m_az_vm_size                = var.az_vm_size
    m_az_project                = var.az_project
    m_az_location               = var.az_location
    m_resource_group_name       = data.azurerm_resource_group.project_rg.name
   
    m_source_image              = data.azurerm_image.templateImage.id
   
 
    m_az_image_data_disk_size   = var.az_image_data_disk_size

    m_az_ssh_allowed_ip         = var.az_ssh_allowed_ip
    m_ssh_username              = var.ssh_username
    m_public_key                = var.ssh_public_key

}
