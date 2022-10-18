data "azurerm_resource_group" "rg-name" {
  name = var.rgname
}
#Create a vNet
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnetname
  address_space       = var.addcidr
  location            = var.location
  resource_group_name = var.rgname
  tags                = var.tags

  depends_on = [data.azurerm_resource_group.rg-name]
}

#Create Subnet
resource "azurerm_subnet" "subnet" {
  name                 = var.snetname
  address_prefixes     = var.snetaddr
  resource_group_name  = var.rgname
  virtual_network_name = var.vnetname
  service_endpoints    = var.sendpoint

}
#Create Public IP Address
/*resource "azurerm_public_ip" "public-ip" {
  name                = var.publicip
  resource_group_name = var.rgname
  location            = var.location
  allocation_method   = var.ipassigntype

}*/

#Create Network Interface
resource "azurerm_network_interface" "vm-nic" {
  name                = var.nicname
  location            = var.location
  resource_group_name = var.rgname

  ip_configuration {
    name                          = var.privateip
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = var.ipassigntype
    #public_ip_address_id          = azurerm_public_ip.public-ip.id

  }
}
# Create a Network Security Group with some rules
resource "azurerm_network_security_group" "nsg" {
  name                = var.nsgname
  location            = var.location
  resource_group_name = var.rgname

  security_rule {
    name                       = "allow_RDP"
    description                = "Allow RDP access"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}
#Associate RG to vNIC
resource "azurerm_network_interface_security_group_association" "nsg-associate" {
  network_interface_id      = azurerm_network_interface.vm-nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}