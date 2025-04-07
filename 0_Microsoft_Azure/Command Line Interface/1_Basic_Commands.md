Welcome to learning azure cli commands with me,

Let's start with stackoverflow link, in case you run into some funny errors.   
[Stackoverflow Help for Azure CLI](aka.ms/azcli/questions)   
<br>
This document is divided into multiple sections, and short description about each of commands,   
which you can `use to learn and master azure cli commands`
<br>

Useful tip:   
**Always try to read the document first before googling, or asking any chat bot**   
<br>


## Default Command Prompt Commands[cmd]
### To start with you can use these commands to get your hands dirty with windows cmd commands

1. List all the default commands that windows command support
 ```bash
help
```

2. Get the help document for default present command of command,     
Replace COMMAND with any command name from the default windows cmd commands, for instance type `cd/?`
 ```bash
COMMAND/?
```

3. Clears the command prompt screen
 ```bash
cls
```

4. Get the history of all the commands used from the time you open your cmd and before closing it
 ```bash
doskey /history
```



## Commands structure[Syntax]
once we start working with azure cli commands,   
we need to understand basic structure of command which is   
1. Group = `az`, meaning azure is a parent keyword which is always needed
2. Subgroups = Inside azure, on what resource we want to work with is called Subgroups, it can login, resource group, account, container, policy and more.
3. Commands = some Subgroups support additional operations, for instance `az storage` supports `copy, remove` commands
4. Arguments = arguments in simple terms is the fields we type in UI, or which we need to be configure for creation of the given resources   
for instance, to create a resource group we need `--name, --location` arguments


```bash
Group [Subgroups] [Commands] [Arguments]
Required [optional] [optional] [optional] 
az      storage        copy        --help
```

## Azure Help commands
### These set of commands will help us find the documents related to particular command and examples.

1. To check azure cli is installed and its version, we use
 ```bash
az --version
```

2. To get the help document for azure cli, use --help command   
`--help` can be used with any az commands to get more info about given command,

 ```bash
az --help
```

3. For example, `az login --help` will give us all the possible usage of login command along with some examples
 ```bash
az login --help
```

4. To get some example related to any command, we can use   `az find command`, where COMMAND can be replaced with any command whose example you want to search for in azure documentation
 ```bash
az find COMMAND
```

5. For example, the below command will list out some example related to creating storage account in azure
 ```bash
az find "az storage account create"
```

## Azure Account, Authentication, Management Groups, Subscriptions related commands
### These set of commands will help us login into our azure account, get subscription details, change the subscription and so on.

1. Login into your azure account, like UI, just type `az login` and it will open one prompt asking to sign in   
Also, it will ask you to select the subscription, this subscription can be chnaged later on 
 ```bash
az login 
```

2. This command will show all the `az account` related help doc
 ```bash
az account --help
```

3. This command will show current subscription related info, by default it returns JSON output
 ```bash
az account show
```

4. This command will return all the subscriptions list in JSON format
 ```bash
az account list 
```

5. To change the format we can use arguments `--output <OUTPUT-FORMAT>`,   
for example, to display all the subscriptions details in table format we can write
```bash
az account list --output table
```

6. This command will return all the locations where we can keep our resources in azure data centers   
Defaut format JSON
 ```bash
az account list-locations
```

7. To see the locations in table format, use this command below
 ```bash
az account list-locations --output table
```

8. To change the subscription of current logged in user, use `set` command with `account` subgroup
```bash
az account set --subscription "<SUBSCRIPTION ID / NAME>"
```

9. To logout from your currenlty logged in account
```bash
az logout
```

<br>

> List Azure Hierarchy!   
> Tenant root group --> Management Groups --> Subscriptions --> Resource Groups --> Resources   
<br>

> What is management groups ?   
> Management Groups comes on 2nd position in terms of Azure hierarchy,   
> which helps us to create a secure layer where we can add policies to multiple subscriptions,   
> we can also set Goverance rules, give Identify Access Control(IAM) here to desired users, etc



10. To Create a management group, we need one required field which is name of management group   
[optional argument, --display-name can be passed, if not passed, it is kept same as --name argument]   
```bash
az account management-group create --name <management-group-name>  [--display-name <display-name>]
```

11. List all the management groups , [needs high role, some roles might return error  trying to list it]
```bash
az account management-group list
```

12. 


## Resouce group Creation commands
### These set of commands will help us in creation of resouce groups, list them, deleting, updating, checking if resource group already present, and more.
1. Read the document related to resource groups, use `--help` with `az group` command
 ```bash
az group --help
```

2. Create a resouce group with minimal required fields, use `create` command
 ```bash
az group create --location centralindia --resource-group sskIn
```

3. To verify resource group is created, list them using `list` command
 ```bash
az group list --output table
```


## Storage account Creation commands
### These set of commands deals with creation of storage account, listing, updating and checking if storage account with same name already present 

1. Get the help document for storage resource
 ```bash
az storage --help
```

2. Get the help document for storage resource, and understand possible subgroups like create, list, delete
 ```bash
az storage account --help
```

3. Help document related to creation of storage account
 ```bash
az storage account create --help
```

4. Command to create storage account with best practises of adding the SKU and location   
`SKU` = `performance` field + `redundancy` field   
`redundancy field` = it helps to decide how many duplication copies we need to create for our storage account
 ```bash
az storage account create --name sskstorageacc --resource-group sskIn --location centralindia --sku Standard_LRS
```

5. List down all the storage account for your subscription
 ```bash
az storage account list
```

6. List storage accounts in table format use `--output table`
 ```bash
az storage account list --output table
```


## Blob Containers creation commands
### These commands will help in creation of blob containers under storage account

## Rest API commands in azure cli
### with Rest API commands, we can call APIs of azure to create, update, delete or display the information about certain required resources

1. To use rest api in azure cli we can use `az rest`, this command below will open the document for it
 ```bash
az rest --help
```

2. This command will help us understand `get` request method in `rest` command
 ```bash
az rest get --help
```
