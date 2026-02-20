# Terraform State and Backend – Beginner Guide

This guide explains Terraform state, backend, drift, import, and useful commands in a simple way.

---

# What is Terraform State?

Terraform state is a file that keeps track of infrastructure created by Terraform.

It maps:

Terraform config file  <-->  Real infrastructure in cloud

Terraform uses state to know:

- What resources exist
- What to create
- What to update
- What to delete

State file name (default):

terraform.tfstate

---

# When is State Created?

State creation depends on whether you use a backend block or not.

---

## Case 1: Without Backend Block (Local State)

If NO backend block is used:

State file is created when you run:

terraform apply

Location:
Local machine (current directory)

File created:
terraform.tfstate

---

## Case 2: With Backend Block (Remote State)

If backend block IS used:

State storage is initialized during:

terraform init

Terraform connects to remote backend and prepares state storage.

Actual state data is written after:

terraform apply

Example backend block:

```
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tf-state"
    storage_account_name = "tfstatestorage"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
```

Advantages of backend:

- Team collaboration
- State locking
- Security
- Backup
- Centralized state management

---

# 4 Common Terraform Scenarios

---

## 1. Add Resource to Configuration

If you add a resource in .tf file:

Result:

- Resource is created in cloud
- Resource is added to state file

---

## 2. Remove Resource from Configuration

If you remove resource from .tf file:

Result:

- Resource is deleted from cloud
- Resource is removed from state file

---

## 3. Modify Resource Manually in Cloud (Drift)

Example:

Terraform config:

replication type = LRS

Manual change in cloud:

replication type = GRS

Now run:

terraform plan

Terraform detects difference. This is called DRIFT.

Terraform will try to change cloud resource to match config.

---

Example: Database size drift

Production database size = 1TB  
Terraform config size = 500GB  

terraform plan result:

Terraform will delete 1TB database and recreate 500GB database.

To fix safely, update config to:

size = 1TB

Then run:

terraform apply

---

## 4. Add Resource Manually in Cloud

If resource is created manually in cloud, Terraform cannot detect it automatically.

To manage it using Terraform, use import:

terraform import <resource-address> <resource-id>

This adds resource to state file.

---

# Terraform Backend Block

Backend stores state remotely instead of locally.

Example backends:

- Azure Storage
- AWS S3
- Terraform Cloud

Benefits:

- Collaboration
- Locking (prevents multiple users changing at same time)
- Security
- Backup

---

## Useful Terraform Commands

---

### terraform init

Initializes Terraform.

- Downloads providers
- Initializes backend
- Prepares state storage

---

### terraform plan

Shows what Terraform will do.

Compares:

Config vs State vs Real Cloud

---

### terraform apply

Creates or updates infrastructure.

Updates state file.

---

### terraform refresh

Updates state file to match real infrastructure.

---

### terraform state list

Shows all resources tracked in state.

Example:

terraform state list

---

### terraform state show

Shows detailed info of resource.

Example:

terraform state show azurerm_storage_account.example

---

### Important Concept Summary

Terraform compares:

Config file  
State file  
Real cloud infrastructure  

Then decides actions.

State file = Terraform memory

---

### Best Practices

- Always use remote backend
- Never edit state file manually
- Always run terraform plan before apply
- Use import to manage manually created resources

---

### Workflow Summary

Without backend:

terraform init  
terraform apply → state created locally  

With backend:

terraform init → backend initialized  
terraform apply → state stored remotely  
