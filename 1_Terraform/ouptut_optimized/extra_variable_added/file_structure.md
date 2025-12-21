## File Structure of example demonstrated for output block

- This example passes name, location of resource group to storage account
- reduces manually writing name, location each time in storage account
- uses resource group object key as reference

```bash
└───extra_variable_added
    │   file_structure.md
    │   
    ├───env
    │   └───sandbox
    │           main.tf
    │           terraform.tfvars
    │
    └───module
        ├───rg
        │       main.tf
        │       
        └───stg
                main.tf
```