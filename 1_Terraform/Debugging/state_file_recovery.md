# 🛠️ Terraform Recovery Runbook  
## Azure Container Apps (State Dependency Fix)

---

## 📌 Overview

This runbook explains how to recover Azure Container Apps when Terraform state dependencies (like nginx, domain mapping, proxy config) block infrastructure recreation.

---

## 🚨 Problem

- Container Apps were deleted
- Terraform state still had:
  - nginx dependencies
  - custom domain bindings
  - proxy configurations
- Terraform failed to recreate resources due to broken dependency graph

---

## 🔍 Root Cause

- Tight coupling inside Terraform state
- Orphaned or invalid references:
  - Domain mapping
  - Proxy configs
  - nginx module dependencies

---

## 🧪 Recovery Strategy

Fix the Terraform state, not just the code.

---

## 🛠️ Steps

### 1. Pull State from Terraform Cloud

```bash
terraform login
terraform state pull > terraform.tfstate
```

---

### 2. Create Local Recovery Workspace

```bash
mkdir recovery-workspace
cd recovery-workspace
mv terraform.tfstate ./terraform.tfstate
```

---

### 3. Backup State (MANDATORY)

```bash
cp terraform.tfstate terraform.tfstate.backup
```

---

### 4. Identify Problematic Dependencies

```bash
cat terraform.tfstate | grep nginx
```

Also check for:
- domain mappings  
- proxy configurations  

---

### 5. Remove Blocking Resources

⚠️ Critical step — be careful

```bash
grep -v "nginx" terraform.tfstate > cleaned.tfstate
mv cleaned.tfstate terraform.tfstate
```

If needed:
- Manually edit JSON
- Remove specific resource blocks
- Fix dependency references

---

### 6. Reconfigure Terraform Cloud Backend

Create main.tf:

```hcl
terraform {
  cloud {
    organization = "YOUR_ORG"

    workspaces {
      name = "YOUR_WORKSPACE"
    }
  }
}
```

---

### 7. Authenticate Terraform

```bash
terraform login
```

---

### 8. Initialize Terraform

```bash
terraform init
```

---

### 9. Push Cleaned State Back

```bash
terraform state push terraform.tfstate
```

---

### 10. Recreate Infrastructure

```bash
terraform plan
terraform apply
```

---

## ✅ Outcome

- Container Apps recreated successfully  
- Terraform state consistency restored  
- Dependency issues resolved  

---

## ⚠️ Important Notes

- Editing state is a last resort  
- Always keep backup before modifying state  
- Validate changes before pushing  

---

## 💡 Key Learnings

- Terraform state is the single source of truth  
- Avoid tight coupling between networking and app layers  
- Separate nginx, domain, and proxy configs from core app modules  
- Design for failure and recovery  

---

## 🔐 Prevention

- Use least privilege access  
- Add resource locks  
- Separate infra responsibilities  
- Use staged deployments  
