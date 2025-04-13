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

    app_gateway_ip = {

      allocation_method = "Static"

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

  custom_data = base64encode(<<CUSTOM_DATA
  #!/bin/bash
  # Update packages
  sudo apt-get update -y

  # Install required packages
  sudo apt-get install -y ca-certificates curl gnupg lsb-release

  # Add Docker GPG key
  sudo install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  sudo chmod a+r /etc/apt/keyrings/docker.gpg

  # Add Docker repository
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  # Install Docker Engine
  sudo apt-get update -y
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

  # Add user to docker group to run docker without sudo
  sudo usermod -aG docker azureuser

  # Apply group changes immediately (for current session)
  newgrp docker
  CUSTOM_DATA
  )




}