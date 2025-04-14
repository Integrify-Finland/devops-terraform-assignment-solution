locals {
  prefix = "devops2-week7-assignment-solution"

  subnets = {
    frontend_subnet = {

      address_prefixes = ["10.0.2.0/24"]

    }

    backend_subnet = {

      address_prefixes = ["10.0.3.0/24"]

    }
  }

  nsg_rule = {
    allow_ssh = {


      priority                   = 1001
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"

    }

    allow_80 = {

      priority                   = 1002
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"


    }
  }

  public_ips = {
    backend_ip = {


      allocation_method = "Dynamic"

    }

    frontend_ip = {

      allocation_method = "Dynamic"

    }


  }

  nics = {
    frontend_nic = {

      ip_configuration_name = "frontend_ip_config"

      subnet = "frontend_subnet"

      private_ip_address_allocation = "Dynamic"

      public_ip = "frontend_ip"

    }

    backend_nic = {

      ip_configuration_name = "frontend_ip_config"

      subnet = "backend_subnet"

      private_ip_address_allocation = "Dynamic"

      public_ip = "backend_ip"

    }
  }

  virtual_machine = {

    backendvm = {

      nic = "backend_nic"


    }

    frontendvm = {

      nic = "frontend_nic"




    }
  }


}