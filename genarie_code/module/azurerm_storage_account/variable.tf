variable "storage_accounts" {
  description = "Nested map for multiple storage accounts"
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    access_tier              = optional(string)
    allow_blob_public_access = optional(bool)
    min_tls_version          = optional(string)
    enable_https_traffic_only = optional(bool)
    is_hns_enabled           = optional(bool)
    account_kind             = optional(string)

    network_rules = optional(object({
      bypass                     = optional(list(string))
      default_action              = optional(string)
      ip_rules                    = optional(list(string))
      virtual_network_subnet_ids  = optional(list(string))
    }))

    blob_properties = optional(object({
      versioning_enabled       = optional(bool)
      change_feed_enabled      = optional(bool)
      delete_retention_policy  = optional(object({
        days = number
      }))
    }))

    queue_properties = optional(object({
      logging = optional(object({
        delete                = bool
        read                  = bool
        write                 = bool
        retention_policy_days = number
      }))
    }))

    tags = optional(map(string))
  }))
}