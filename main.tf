# Defining network to put the VM in
module "resourceGroup" {
  source = "./modules/resourceGroup"
  RGname = "${var.RGname}"
  location = "${var.location}"
  
}
module "network" {
    source = "./modules/network"
    #Creates dependency, waits for resourceGroup to finish.
    RGname = "${module.resourceGroup.RGname}"
    location = "${var.location}"
}
# Defining the actual machine using module "compute" from Terraform Registry.
module "linuxserver" {
    source = "Azure/compute/azurerm"
    location = "${var.location}"
    vm_os_simple = "${var.os}"
    public_ip_dns = ["linux1234"]
    #Creates dependency, waits for resourceGroup to finish.
    resource_group_name = "${module.resourceGroup.RGname}"
    vnet_subnet_id = "${module.network.trainingNetworksSubnetId}"
    storage_account_type = "Standard_LRS"
    vm_size = "Standard_B1ls"
    tags {
      "environment" = "trainingENV"
    }
}



