# Terraform Basics: for_each, Map Variables, Nested Maps, Data Sources, and Outputs

This document explains some commonly used Terraform concepts with Azure examples:

- `for_each` with a map
- Nested maps
- `data` blocks
- `output` blocks

The examples use Azure resources like **Resource Groups** and **Storage Accounts**.

## 1. Using for_each with a Map

A **map** is a key-value pair.

Example:
key -> resource group name  
value -> location

Terraform will create one resource for each key-value pair.

Example Variable:

```bash
variable "mapofrg" {
  type = map(string)
  default = {
    "rg-ssk-003" = "centralindia"
    "rg-ssk-004" = "westus"
    "rg-ssk-005" = "centralus"
  }
}
```

Resource using for_each:

```bash
resource "azurerm_resource_group" "resource_group" {
  for_each = var.mapofrg
  name     = each.key
  location = each.value
}
```

### Explanation

for_each = var.mapofrg  
Terraform loops through the map.

each.key → Resource Group Name  
each.value → Azure Location

## 2. Using for_each with Nested Maps

Sometimes a resource needs **multiple properties**, not just one value.

For example, a Storage Account requires:

- name
- resource group
- location
- account tier
- replication type

In this case we use a **nested map (map of objects)**.

Example:

```bash
variable "storage_accounts" {
  default = {
    "storage1" = {
      rg_name                  = "rg-ssk-003"
      location                 = "centralindia"
      name                     = "cucnncnsskc1"
      account_tier             = "Standard"
      account_replication_type = "LRS"
    }
  }
}
```

Resource:

```bash
resource "azurerm_storage_account" "storage_account" {
  for_each = var.storage_accounts
  name                     = each.value.name
  resource_group_name      = each.value.rg_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}
```

### Explanation

```bash
each.key                            → map key (storage1)   
each.value                          → object containing multiple properties

each.value.name                     → storage account name  
each.value.rg_name                  → resource group  
each.value.location                 → deployment location  
each.value.account_tier             → performance tier  
each.value.account_replication_type → replication type  
```

## 3. Data Block

A **data block** is used to fetch information about resources that already exist in the cloud.

Example:

```bash
data "azurerm_resource_group" "resource_group" {
  name = "rg-ssk-003"
}
```

You can reference its values like this:

data.azurerm_resource_group.resource_group.name  
data.azurerm_resource_group.resource_group.location  

## 4. Output Block

An **output block** prints values after Terraform finishes execution.

Example:

```bash
resource "azurerm_resource_group" "resource_group" {
  name     = "rg-demo-output"
  location = "centralindia"
}

output "resource_group_name" {
  value = azurerm_resource_group.resource_group.name
}
```

After running:

```
terraform apply
```

Terraform will display something like:

```
resource_group_name = rg-demo-output
```

## 5. Summary

Concept | Purpose
------ | -------
map | Stores key-value pairs
for_each | Loops through a map to create multiple resources
nested map | Stores multiple properties per resource
data block | Reads existing resources from cloud
output block | Prints values after terraform apply
