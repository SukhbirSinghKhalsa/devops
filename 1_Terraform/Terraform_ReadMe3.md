# 📘 Terraform Variables – Beginner Guide

Terraform variables help you make your configuration flexible and reusable.

Instead of hardcoding values, you can use **variables as placeholders** and assign values later.

---

# 1️⃣ Declaring a Variable

To declare a variable in Terraform:

```hcl
variable "age" {
}
```

✔ This creates a variable named `age`  
✔ All arguments inside the variable block are optional  

---

# 2️⃣ Calling (Using) a Variable

To use a variable inside your Terraform configuration:

👉 Syntax:

```
var.variable_name
```

Example:

```hcl
var.age
```

---

# 3️⃣ Setting Variable Values

❌ You **cannot** directly assign a value inside a `.tf` file like this:

```hcl
age = 18   # NOT allowed directly in main.tf
```

Terraform does not allow setting variable values this way inside normal `.tf` files.

---

# ✅ Ways to Define Variable Values (Scenarios)

## 🔹 Scenario 1 – Using Default Value

```hcl
variable "age" {
  default = 18
}
```

✔ If no other value is provided, Terraform uses the default.

---

## 🔹 Scenario 2 – Using Special Default Files

Terraform automatically reads values from:

- `terraform.tfvars`
- `*.auto.tfvars`

Example (`terraform.tfvars`):

```hcl
age = 18
```

✔ This is the recommended way to store variable values.

---

## 🔹 Scenario 3 – When No Value is Defined

If:

- You declare a variable
- But do NOT give a default
- And do NOT define it in tfvars

👉 Terraform will ask for the value in the command line during `terraform apply`.

---

# 📊 Variable Priority Order

If the same variable is defined in multiple places, Terraform follows this priority:

| Priority | Method | Level |
|----------|--------|--------|
| 0 | `-var-file` flag | 🔥 Highest |
| 1 | `*.auto.tfvars` | |
| 2 | `terraform.tfvars` | |
| 3 | `default` inside variable block | |
| 4 | CLI input prompt | ⬇ Lowest |

---

# 🎯 Advantages of Using Variables

- ✔ Works as a **placeholder**
- ✔ Write once, use in many places
- ✔ Supports multiple data types
- ✔ Variables are defined using a **block**

Basic structure:

```hcl
variable "variable_name" {
  # all the arguments are optional
}
```

---

# 🧩 Types of Variables

Terraform variables are divided into two main types:

---

## 🔹 1. Basic Variables (Single Value)

Used to store one value.

Supported types:

- `string`
- `number`
- `bool`

Example:

```hcl
variable "age" {
  type = number
}
```

---

## 🔹 2. Advanced Variables (Collections – Multiple Values)

Used to store multiple values.

---

### 1️⃣ List

```
list = [ ]
```

✔ Collection  
✔ Duplicate values allowed  
✔ Ordered  
✔ Index-based  

Example:

```hcl
["apple", "orange", "banana", "apple"]
```

Index positions:

```
0        1         2         3
apple   orange    banana    apple
```

---

### 2️⃣ Set

```
set = [ ]
```

✔ Collection  
❌ No duplicate values allowed  
❌ Unordered  
✔ Element-based (not index-based)

Example:

```hcl
["apple", "orange", "banana"]
```

---

### 3️⃣ Map

```
map = { }
```

✔ Key-value pair  
✔ Keys cannot be duplicated  
✔ Ordered  

Example:

```hcl
{
  name     = "rg-ssk"
  location = "centralindia"
}
```

Structure:

```
key = value
```

---

# 🚀 Bonus Tip – Backend Block Removal

If you remove a backend block that was pointing to a blob container (state file storage), Terraform will show this message:

```
A change in the backend configuration has been detected, 
which may require migrating existing state.

If you wish to attempt automatic migration of the state, 
use "terraform init -migrate-state".

If you wish to store the current configuration with no changes 
to the state, use "terraform init -reconfigure".
```

## What It Means

When backend configuration changes:

- `terraform init -migrate-state`
  → Migrates existing state automatically.

- `terraform init -reconfigure`
  → Reconfigures backend without migrating state.

---

# 📌 Summary

- Variables make Terraform reusable and flexible.
- Declare using `variable` block.
- Use with `var.variable_name`.
- Define values using:
  - Default
  - `terraform.tfvars`
  - `*.auto.tfvars`
  - `-var-file`
  - CLI input
- Support basic and advanced types (list, set, map).
- Backend changes require `init -migrate-state` or `init -reconfigure`.

---

✨ Happy Learning Terraform!
