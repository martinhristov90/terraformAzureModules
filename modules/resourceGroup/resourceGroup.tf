resource "azurerm_resource_group" "trainingRG" {
  name     = "${var.RGname}"
  location = "${var.location}"

  # Tagging for easier search.
  tags {
    environment = "trainingENV"
  }
}

output "RGname" {
  value = "${azurerm_resource_group.trainingRG.name}"
}
