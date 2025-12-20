variable "resource_groups" {
  description = "Nested map of resource groups with name, location, and tags"
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}