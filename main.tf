data "azurerm_resource_group" "existing" {
  name = "${var.network-rg}"
}

data "azurerm_virtual_network" "existing" {
  name                = "project-network"
  resource_group_name = data.azurerm_resource_group.existing.name
}

data "azurerm_subnet" "existing" {
  name                 = "app-subnet-1"
  virtual_network_name = data.azurerm_virtual_network.existing.name
  resource_group_name  = data.azurerm_resource_group.existing.name
}

resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-k8s-resources"
  location = var.location
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "example-aks1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
    vnet_subnet_id = data.azurerm_subnet.existing.id
  }

  network_profile {
    network_plugin = "azure"
    service_cidr = "172.16.0.0/16"
    dns_service_ip = "172.16.0.10"
    docker_bridge_cidr = "172.17.0.1/16"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.example.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.example.kube_config_raw
  sensitive = true
}
