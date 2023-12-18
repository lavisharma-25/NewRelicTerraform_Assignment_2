# Configure terraform
terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
    }
  }
}

# Configure the New Relic provider
provider "newrelic" {
  account_id = 4267261
  api_key = "NRAK-UDEZTJWEVPGNR2U6JX8MMEUTKAV"
  region = "EU"
}