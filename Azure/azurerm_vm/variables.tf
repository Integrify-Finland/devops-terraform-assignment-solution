variable "resource_group_name" {

  type = string

}

variable "location" {

  type = string

}

variable "custom_data" {
  
}

variable "computer_name" {
  
}


variable "vm_name" {

  type = string

}

variable "vm_size" {
  type = string

}

variable "username" {

  type = string

  default = "azureuser"

}

variable "storage_account_type" {

  type = string

  default = "Standard_LRS"

}

variable "source_image_reference_offer" {

    default = "0001-com-ubuntu-server-jammy"
  
}

variable "source_image_reference_publisher" {
   default = "Canonical"
}

variable "source_image_reference_sku" {
   default = "22_04-lts"
}

variable "source_image_reference_version" {
   default = "latest"
}

variable "public_key" {
  
}

variable "nic_id" {
  
}