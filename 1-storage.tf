resource "azurerm_storage_account" "st_webapp" {
  name = "mytestwebapp02132024"

  resource_group_name = azurerm_resource_group.rg_test.name
  location = azurerm_resource_group.rg_test.location

  account_tier = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"

  static_website {
    index_document = "index.html"
  }
}

resource "azurerm_storage_blob" "mainpage" {
  name = "index.html"
  storage_container_name = "$web"
  storage_account_name = azurerm_storage_account.st_webapp.name
  type = "Block"
  content_type = "text/html"
  source = "index.html"
}