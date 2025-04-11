resource "azurerm_linux_virtual_machine" "virtual_machine" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.username
  network_interface_ids = [
    var.nic_id,
  ]

  admin_ssh_key {
    username   = var.username
    public_key = var.public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.storage_account_type
  }

  custom_data = var.custom_data

  computer_name = var.computer_name

  source_image_reference {
    publisher = var.source_image_reference_publisher
    offer     = var.source_image_reference_offer
    sku       = var.source_image_reference_sku
    version   = var.source_image_reference_version
  }
}