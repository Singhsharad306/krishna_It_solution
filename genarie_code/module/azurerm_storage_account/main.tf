resource "azurerm_storage_account" "stg" {
  for_each                 = var.storage_accounts

  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  access_tier              = lookup(each.value, "access_tier", "Hot")
  min_tls_version          = lookup(each.value, "min_tls_version", "TLS1_2")
  is_hns_enabled           = lookup(each.value, "is_hns_enabled", false)
  account_kind             = lookup(each.value, "account_kind", "StorageV2")

  dynamic "blob_properties" {
    for_each = lookup(each.value, "blob_properties", null) == null ? [] : [each.value.blob_properties]
    content {
      versioning_enabled  = lookup(blob_properties.value, "versioning_enabled", false)
      change_feed_enabled = lookup(blob_properties.value, "change_feed_enabled", false)

      dynamic "delete_retention_policy" {
        for_each = lookup(blob_properties.value, "delete_retention_policy", null) == null ? [] : [blob_properties.value.delete_retention_policy]
        content {
          days = lookup(delete_retention_policy.value, "days", 7)
        }
      }
    }
  }
  tags = merge(
    {
      Environment = "Production"
      ManagedBy   = "Terraform"
    },
    lookup(each.value, "tags", {})
  )
}