output "public_ip" {

    value = [for instance in module.virtual_machine : instance.public_ip_address]
  
}

