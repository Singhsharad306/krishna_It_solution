variable "username_secret_name" {
  description = "The name of the Key Vault to create."
  type        = string  
}

variable "password_secret_name" {
  description = "The name of the password secret to store in the Key Vault."
  type        = string  
}