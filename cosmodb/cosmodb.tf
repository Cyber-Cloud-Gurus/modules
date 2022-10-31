resource "azurerm_cosmosdb_account" "cosmo_db_acc {
  name                = var.cosmo_db_acount_name
  location            = var.location
  resource_group_name = var.rgname
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  enable_automatic_failover = true

   consistency_policy {
      consistency_level = "Session"
  }

  geo_location {
      location = "${var.failover_location}"
      failover_priority = 1
  }

  geo_location {
      location = "${var.location}"
      failover_priority = 0
  }
}

resource "azurerm_cosmosdb_sql_database" "db" {
  name = "cosmo_db_sql"
  resource_group_name = "${azurerm_cosmosdb_account.cosmo_db_acc.resource_group_name}"
  account_name = "${azurerm_cosmosdb_account.cosmo_db_acc.name}"
}

resource "azurerm_cosmosdb_sql_container" "coll" {
  name = "Product1"
  resource_group_name = "${azurerm_cosmosdb_account.cosmo_db_acc.resource_group_name}"
  account_name = "${azurerm_cosmosdb_account.cosmo_db_acc.name}"
  database_name = "${azurerm_cosmosdb_sql_database.db.name}"
  partition_key_path = "/Product1Id"
}