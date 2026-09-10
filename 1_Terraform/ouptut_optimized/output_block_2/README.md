# Azure Resource Group + Storage Account Terraform

This example uses two separate modules:

- `modules/resource-group`
- `modules/storage-account`

Both resources use `map(object)` and `for_each`.

The Resource Group module outputs only a map of Resource Group IDs.
The Storage Account module receives those IDs and uses an Azure data source
to resolve the RG name/location required by `azurerm_storage_account`.

## Run

```bash
az login
terraform init
terraform plan
terraform apply
terraform output
```

Example relationship:

stg1 -> rg1 -> rg-dev
stg2 -> rg2 -> rg-prod
