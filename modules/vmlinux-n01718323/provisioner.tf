
resource "null_resource" "linux_provisioner" {
  for_each = azurerm_linux_virtual_machine.linux_vm


  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = var.admin_username
      private_key = file(var.private_key)

      host = azurerm_public_ip.linux_vm[each.key].ip_address # Ensure this is assigned
    }

    inline = [
      "echo 'Provisioning VM...'",
      "echo VM Hostname: $(hostname)",

    ]
  }
    depends_on = [
    azurerm_linux_virtual_machine.linux_vm, # Ensure VM is created
    azurerm_public_ip.linux_vm              # Ensure public IP exists
  ]
}
