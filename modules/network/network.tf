resource "azurerm_virtual_network" "trainingNetwork" {
  name                = "${var.RGname}-trainingNetwork"
  address_space       = ["10.0.0.0/16"]
  location            = "${var.location}"
  resource_group_name = "${var.RGname}"

  # Tagging for easier search.
  tags {
    environment = "trainingENV"
  }
}

resource "azurerm_subnet" "trainingSubnet" {
  name                 = "${var.RGname}-trainingSubnet"
  resource_group_name  = "${var.RGname}"
  virtual_network_name = "${azurerm_virtual_network.trainingNetwork.name}"
  address_prefix       = "10.0.1.0/24"
}

output "trainingNetworksSubnetId" {
  value = "${azurerm_subnet.trainingSubnet.id}"
}
