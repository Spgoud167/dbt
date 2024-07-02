provider "onepassword" {
  #url                   = "https://my.1password.com"
  #token                 = "eyJhbGciOiJFUzI1NiIsImtpZCI6Imw0dXZnbXh6ZXhnYTNiaWU0cnRlcGd5bWh1IiwidHlwIjoiSldUIn0.eyIxcGFzc3dvcmQuY29tL2F1dWlkIjoiTDQ1S1ZLU0s2WkdDVE8yTFJNN0czSDMzVk0iLCIxcGFzc3dvcmQuY29tL3Rva2VuIjoiTU9PNGdYX2JqTGNGS0tPUHQtQzl0TV9ianFSRkZWTmwiLCIxcGFzc3dvcmQuY29tL2Z0cyI6WyJ2YXVsdGFjY2VzcyJdLCIxcGFzc3dvcmQuY29tL3Z0cyI6W3sidSI6Ind5Ym11N2ZhNHpwMnB0aXpzbnZ2cmtrZG55IiwiYSI6NDh9XSwiYXVkIjpbImNvbS4xcGFzc3dvcmQuY29ubmVjdCJdLCJzdWIiOiI2WklNRE1RSVNSQkozT0lYVzc1NUZFVkQ3USIsImlhdCI6MTcxOTkxNDM2NCwiaXNzIjoiY29tLjFwYXNzd29yZC5iNSIsImp0aSI6ImQya3VudmNwN3MyeGJodmp0M3ljd2xxZHVtIn0.5Zq9akBYvBRO2a80-LA9icyUWBpGF2XQm-8oCEbJvQjxPvY9v_zCHT91DEyzw7GIFvmU0zBbJalWhyJi0eNqvA"
  service_account_token = "SERVICE_ACCOUNT_TOKEN"
  #account               = "https://my.1password.com"
  op_cli_path           = "OP_CLI_PATH"
}

terraform {
  required_providers {
    onepassword = {
      source  = "1Password/onepassword"
      version = "~> 2.1.0"
    }
  }
}


data "onepassword_vault" "demo_vault" {
  name = "trouble"
}
resource "onepassword_item" "example" {
  vault = data.onepassword_vault.demo_vault.uuid
}


/*
resource "onepassword_item" "demo_login" {
  vault = data.onepassword_vault.demo_vault.uuid

  title    = "Demo"
  category = "login"
  username = "test@example.com"

  tags = ["Terraform", "Automation"]

  password_recipe {
    length  = 32
    digits  = false
    symbols = false
  }
}


resource "onepassword_item" "example" {
  vault = "saip"

  title    = "testlogin"
  category = "login"

  password_recipe {
    length  = 40
    symbols = false
  }

  section {
    label = "Example"

    field {
      label = "Example field"
      type  = "DATE"
      value = "2024-01-31"
    }
  }
}
*/