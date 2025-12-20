storage_accounts = {
  stg1 = {
    name                     = "stgsharaddev123"
    resource_group_name      = "rg-sharad-dev"
    location                 = "East US"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    access_tier              = "Hot"

       network_rules = {
      default_action = "Deny"
      bypass         = ["AzureServices"]
      ip_rules       = ["103.22.33.44"]
    }

    blob_properties = {
      versioning_enabled = true
      delete_retention_policy = {
        days = 10
      }
    }
    tags = {
      Environment = "Dev"
      Project     = "Azure-Demo"
      Owner       = "Sharad Singh"
    }
  }

  stg2 = {
    name                     = "stgsharadtest456"
    resource_group_name      = "rg-sharad-test"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    access_tier              = "Cool"

       network_rules = {
      default_action = "Deny"
      bypass         = ["AzureServices"]
      ip_rules       = ["103.22.33.44"]
    }

    blob_properties = {
      versioning_enabled = true
      delete_retention_policy = {
        days = 10
      }
    }
    tags = {
      Environment = "Test"
      Project     = "Bank-App"
      Owner       = "Sharad Singh"
    }
  }

  stg3 = {
    name                     = "stgsharadprod789"
    resource_group_name      = "rg-sharad-prod"
    location                 = "West Europe"
    account_tier             = "Standard"
    account_replication_type = "RAGRS"
    access_tier              = "Hot"

       network_rules = {
      default_action = "Deny"
      bypass         = ["AzureServices"]
      ip_rules       = ["103.22.33.44"]
    }

    blob_properties = {
      versioning_enabled = true
      delete_retention_policy = {
        days = 10
      }
    }
    tags = {
      Environment = "Prod"
      Project     = "Main-System"
      Owner       = "Sharad Singh"
    }
  }
}