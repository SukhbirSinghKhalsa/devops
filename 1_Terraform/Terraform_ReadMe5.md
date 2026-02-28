# Terraform Meta-Arguments: count vs for_each - Beginner Friendly README

## INTRODUCTION
- When creating multiple resources in Terraform, we commonly use:
1) count
2) for_each

- Both can create multiple resources, but they behave very differently.
- In real-world projects, choosing the correct one is very important.


# PART 1: Using count with list
# Example:

```bash
variable "listofrg" {
  default = ["rg-ssk-003", "rg-ssk-004", "rg-ssk-005"]
}

resource "azurerm_resource_group" "resource_group" {
  count    = length(var.listofrg)
  name     = var.listofrg[count.index]
  location = "eastus"
}
```

## FIRST terraform apply creates:

- resource_group[0] → rg-ssk-003
- resource_group[1] → rg-ssk-004
- resource_group[2] → rg-ssk-005

- Everything works fine initially.

## What happens if we remove rg-ssk-004?

- Now change variable:

```bash
variable "listofrg" {
  default = ["rg-ssk-003", "rg-ssk-005"]
}
```

## Old state:

- [0] → rg-ssk-003  
- [1] → rg-ssk-004  
- [2] → rg-ssk-005  

## New configuration:

- [0] → rg-ssk-003  
- [1] → rg-ssk-005  

- Terraform compares using INDEX, not NAME.

- Terraform thinks:
  - resource_group[1] changed from rg-ssk-004 → rg-ssk-005  
  - resource_group[2] no longer exists  

- So Terraform will:
  - Destroy rg-ssk-004  
  - Destroy rg-ssk-005  
  - Recreate rg-ssk-005 at index [1]  

- Even though we only removed rg-ssk-004, rg-ssk-005 also gets destroyed and recreated.
- This problem is called: INDEX DRIFT
- This is dangerous in production environments,especially for databases, VMs, storage accounts, etc.


# Problems with count + list
1) Index-based tracking  
2) Resource drift when list changes  
3) Unnecessary destroy and recreate  
4) Limited flexibility  
5) Hard to manage multiple dynamic attributes  


# PART 2: Using for_each (Recommended)
## for_each is a meta-argument used to create multiple resources safely.

- It supports:
  - set(string)
  - map(string)

- It provides two objects:
  - each.key
  - each.value


# Using for_each with SET
# In a set:
  - each.key   = element  
  - each.value = element  

## Example:

```bash
variable "setofrg" {
  type = set(string)

  default = [
    "rg-ssk-003",
    "rg-ssk-004",
    "rg-ssk-005"
  ]
}

resource "azurerm_resource_group" "resource_group" {
  for_each = var.setofrg
  name     = each.value
  location = "eastus"
}
```

- Terraform tracks resources like:

  - resource_group["rg-ssk-003"]  
  - resource_group["rg-ssk-004"]  
  - resource_group["rg-ssk-005"]  

- Now if we remove "rg-ssk-004", only that specific resource is destroyed.

- No index shifting.  
- No unwanted recreation.  


# Using for_each with MAP
## In a map:
- each.key   = left side (key)  
- each.value = right side (value)  

## Example:

```bash
variable "mapofrg" {
  type = map(string)

  default = {
    "rg-ssk-003" = "centralindia"
    "rg-ssk-004" = "westus"
    "rg-ssk-005" = "centralus"
  }
}

resource "azurerm_resource_group" "resource_group" {
  for_each = var.mapofrg
  name     = each.key
  location = each.value
}
```

- This allows:
  - Dynamic names  
  - Dynamic locations  
  - Clean and scalable configuration  


# Converting list to set using toset()
## for_each does NOT accept list directly.
- If you have a list, convert it:

```bash
resource "azurerm_resource_group" "resource_group" {
  for_each = toset(["rg-ssk-003", "rg-ssk-004", "rg-ssk-005"])
  name     = each.value
  location = "eastus"
}
```


# count vs for_each Comparison
## count
- Uses numeric index  
- Risk of index drift  
- Less flexible  
- Not ideal for production  

for_each
- Uses key-based tracking  
- No index drift  
- More flexible  
- Production friendly  
- Supports map and set  


# FINAL RECOMMENDATION
- Use count only for simple identical resources.
- Use for_each for real-world infrastructure.
- Prefer map when multiple attributes are dynamic.
- Use toset() when converting list to use with for_each.
- for_each is safer, cleaner, and production-ready.
