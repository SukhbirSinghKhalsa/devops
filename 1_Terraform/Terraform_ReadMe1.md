# Terraform Dependency – Implicit and Explicit

This project demonstrates how Terraform handles resource dependencies using **implicit** and **explicit** dependency.

---
### Implicit Dependency
<img width="1171" height="667" alt="image" src="https://github.com/user-attachments/assets/fadf2e81-ba64-45e5-8a2d-e3f77d263a83" />

### Explicit Dependency
<img width="935" height="412" alt="image" src="https://github.com/user-attachments/assets/dd3393ae-7567-48ee-838f-b00072a45af7" />

# What is Dependency in Terraform?

Terraform creates resources based on a **dependency graph**.

- If no dependency → resources created in parallel
- If dependency exists → Terraform creates resources in correct order

Example flow from diagram:

```
Resource Group → Storage Account
```

Terraform creates Resource Group first, then Storage Account.

---

# Implicit Dependency (Automatic)

Implicit dependency happens when one resource references another resource attribute.

Example:

```hcl
resource "azurerm_resource_group" "example" {
  name     = "SSK-RG-001"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                 = "storageaccountname"
  resource_group_name  = azurerm_resource_group.example.name
  location             = "West Europe"
}
```

This line creates implicit dependency:

```hcl
resource_group_name = azurerm_resource_group.example.name
```

Terraform automatically understands:

- Storage Account depends on Resource Group
- Resource Group is created first

No manual configuration needed.

---

# Explicit Dependency (Manual)

Explicit dependency is defined using `depends_on`.

Example:

```hcl
resource "azurerm_storage_account" "example" {
  name                = "storageaccountname"
  resource_group_name = "SSK-RG-001"
  location            = "West Europe"

  depends_on = [
    azurerm_resource_group.example
  ]
}
```

Terraform will create Resource Group first because of `depends_on`.

---

## Key Difference

### Implicit Dependency  
- Automatic  
- Uses resource reference  
- Recommended  

### Explicit Dependency  
- Manual  
- Uses depends_on  
- Used only when implicit dependency is not possible  

---

## Summary

- Terraform uses dependency graph to determine resource order
- Implicit dependency is automatic and preferred
- Explicit dependency is manual and used when needed
- Ensures correct and reliable infrastructure creation


# Terraform State File
---
#### terraform plan --> temporary -- comes and goes
#### terraform apply --> state is created for the first time
#### state file --> record of all the resources created using terraform


1 Add to config - .tf file  
-- tries to add the resource in azure

2 Add changes to portal - .tf file    
-- tries to replace the value in azure

3 remove from config - .tf file    
-- tries to destroy the resource in azure

4 remove from portal - azure    
-- if it is present in config + state file -- tries to create/ add the resource
