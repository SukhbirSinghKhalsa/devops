# 📘 Terraform Meta Arguments – Beginner Guide

This guide explains:

- How to access List, Set, and Map
- Real-world use cases
- Terraform meta-arguments
- Deep understanding of count
- Examples using Azure Resource Group

------------------------------------------------------------

# 📌 Accessing Data Types in Terraform

## 1️⃣ List

A list is an ordered collection of values.
```bash
variable "users" {
  type    = list(string)
  default = ["user1", "user2", "user3"]
}
```
Accessing List Elements:

var.users[0]   # user1
var.users[1]   # user2

✔ Ordered
✔ Duplicates allowed

------------------------------------------------------------

## 2️⃣ Set

A set is an unordered collection of unique values.
```bash
variable "allowed_ips" {
  type    = set(string)
  default = ["10.0.0.1", "10.0.0.2"]
}
```
Important:
- ❌ Cannot access using index
- Order not guaranteed
- Values are unique

------------------------------------------------------------

## 3️⃣ Map

A map stores values in key = value format.
```bash
variable "user_roles" {
  type = map(string)
  default = {
    user1 = "admin"
    user2 = "developer"
  }
}
```
Accessing Map Elements:

var.user_roles["user1"]   # admin

✔ Accessed using keys

------------------------------------------------------------

# 📌 Real-World Applications

List / Set Use Cases:

- Allowed IP addresses
- Allowed roles
- Allowed users
- Multiple resource names

Map Use Cases:

- Multiple resources in tfvars
- JSON-like structured configuration
- Same keys with different values

------------------------------------------------------------

# 📌 Terraform Meta Arguments

Meta arguments change Terraform execution behavior.

1️⃣ depends_on

By default Terraform creates resources in parallel.
Use depends_on to control order.

Example:
```bash
resource "azurerm_resource_group" "rg1" {
  name     = "rg-demo"
  location = "East US"
}

resource "azurerm_storage_account" "storage" {
  name                     = "demostorage12345"
  resource_group_name      = azurerm_resource_group.rg1.name
  location                 = azurerm_resource_group.rg1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  depends_on = [azurerm_resource_group.rg1]
}
```
------------------------------------------------------------

2️⃣ count

count allows creation of multiple resources using a whole number.

count = 3

Terraform creates 3 resources.

Special object:
count.index

- Starts from 0
- Used for dynamic naming

------------------------------------------------------------

# 📌 Learning count in Depth (Azure Resource Group Examples)

Scenario 1: Duplicate name (will fail)
```bash
resource "azurerm_resource_group" "rg" {
  count    = 2
  name     = "demo-rg"
  location = "East US"
}
```
Output:
demo-rg
demo-rg

------------------------------------------------------------

Scenario 2: Using count.index in name
```bash
resource "azurerm_resource_group" "rg" {
  count    = 3
  name     = "demo-rg-${count.index}"
  location = "East US"
}
```
Output:
demo-rg-0
demo-rg-1
demo-rg-2

------------------------------------------------------------

Scenario 3: Using count with list variable
```bash
variable "listofrg" {
  type    = list(string)
  default = ["dev-rg", "qa-rg", "prod-rg"]
}

resource "azurerm_resource_group" "rg" {
  count    = 3
  name     = var.listofrg[count.index]
  location = "East US"
}
```
Output:
dev-rg
qa-rg
prod-rg

------------------------------------------------------------

Scenario 4: Using length() with count (Best Practice)
```bash
resource "azurerm_resource_group" "rg" {
  count    = length(var.listofrg)
  name     = var.listofrg[count.index]
  location = "East US"
}
```
If you update list:
["dev-rg", "qa-rg", "prod-rg", "uat-rg"]

Terraform will automatically create 4 resource groups.

------------------------------------------------------------

# 📌 Summary

- List  -> Ordered, accessed by index
- Set   -> Unordered, no index access
- Map   -> Accessed by keys

- count -> Creates multiple resources
- depends_on -> Controls execution order

------------------------------------------------------------

# 📂 Recommended Project Structure
```bash
terraform-project/
│── main.tf
│── variables.tf
│── terraform.tfvars
│── outputs.tf
│── README.md
```
