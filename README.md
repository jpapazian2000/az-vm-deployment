# auchan-poc

![auchan_logo](https://github.com/jpapazian2000/auchan-poc/tree/a5eb628d525680dc4d76576576dda442b0994f14/images/auchan.gif)

## Preparation

### Git Repos
Please fork and download the 2 repos:
[main_folder](https://github.com/jpapazian2000/az-vm-deployment)
[azure_modeule](https://github.com/jpapazian2000/terraform-azurerm-jpapazian-az-vm)

### Azure Environment Preparation
This demo will deploy azure VMs in 2 azure Availability zones.
It is intended to showcase Terraform Cloud's ability to manage the whole lifeclycle of the provisionning
In order to do so we will first create à packer image of the image we want to deploy
There is a packer template file in the files directory of this github repo
Fill in the mandatory fields:
```
    "client_id": "xxxxxxxxxxx",
    "client_secret": "xxxxxxxxxxx",
    "tenant_id": "xxxxxxxxxxx",
    "subscription_id": "xxxxxxxxxxx",
```
Next if needed add some tags:
```
"azure_tags": {
        "owner": "xxxxxxx",
        "project": "customer demo"
    },
```
Then, add also the azure resource group and the name of the template who will host the template:
```
"managed_image_resource_group_name": "xxxxxxx-rg",
    "managed_image_name": "az-vm-template",
```

And finally do not forget to indicate the location where you want your template to be deployed:
```
"location": "France Central",
```
You can change as well other variables if you want such as the disk size, the vm_size, etc...but that's not mandatory

Then you need to create this image.
If you have packer already installed, simply run:
```
packer validate az-vm-project.json
packer build az-vm-project.json
```
At the end of the run you will have your template avaiable in your resource group in azure.
If packer is not installed you can download it from [PACKER](https://www.packer.io/downloads)

The last step in the azure setup is the creation/configuration of a storageaccount.
Create one, and copy the url of the primary endpoint of the blob service

Copy this url in the git module repo, in the azure.tf file, in the azurerm_linux_virtual_machine resource in place of the existing definition for the storage account

### Configuration of TFCB

You need to have an organization already setup and a workspace with the following terraform variables set up:
```
az_location
az_project
ssh_username
ssh_public_key
az_ssh_allowed_ip
az_vm_size
az_image_data_disk_size
```
And also the envorinment variables:
```
ARM_SUBSCRIPTION_ID
ARM_CLIENT_ID
ARM_CLIENT_SECRET
ARM_TENANT_ID
````


