# vnets = {
#   vnet1 = {
#     name                = "vnet-sharad-dev"
#     address_space       = ["10.0.0.0/16"]
#     location            = "East US"
#     resource_group_name = "rg-sharad-dev"
#     dns_servers         = ["8.8.8.8", "8.8.4.4"]
#     tags = {
#       Environment = "Dev"
#       Owner       = "Sharad Singh"
#     }
#     subnets = {
#       subnet1 = {
#         name           = "subnet-dev-app"
#         address_prefixes = ["10.0.1.0/24"]
#       }
#       subnet2 = {
#         name           = "subnet-dev-db"
#         address_prefixes = ["10.0.2.0/24"]
#       }
#     }
#   }

#   vnet2 = {
#     name                = "vnet-sharad-prod"
#     address_space       = ["10.0.10.0/16"]
#     location            = "West Europe"
#     resource_group_name = "rg-sharad-prod"
#     tags = {
#       Environment = "Prod"
#       Owner       = "Sharad Singh"
#     }
#     subnet4 = {
#       subnet1 = {
#         name           = "subnet-dev-app"
#         address_prefixes = ["10.0.1.0/24"]
#       }
#       subnet5 = {
#         name           = "subnet-dev-db"
#         address_prefixes = ["10.0.2.0/24"]
#       }
#     }
#   }
# }
