# Terraform README

## What is Terraform?

Terraform is an Infrastructure as Code (IaC) tool developed by
HashiCorp. It allows you to create, manage, and update infrastructure in
a declarative way.

Declarative means you only define *what* you want, and Terraform handles
*how* to create it in the backend.

------------------------------------------------------------------------

## Key Features

-   Declarative configuration
-   Multi-cloud support (AWS, Azure, GCP, etc.)
-   Uses Providers to communicate with cloud platforms via APIs
-   Uses HashiCorp Configuration Language (HCL)
-   Maintains a state file to track infrastructure
-   File extension: `.tf`
-   Terraform Registry provides providers, modules, and examples

------------------------------------------------------------------------

## Terraform Syntax

Terraform uses Blocks and Arguments.

### Block Structure

    block_type {
    }

Blocks define infrastructure components.

------------------------------------------------------------------------

## Types of Blocks

### 1. Single-name Block

Syntax:

    name {
    }

Example:

    terraform {
    }

Usage: - Declared only once in a `.tf` file - Used for Terraform
settings

------------------------------------------------------------------------

### 2. Block with One Label

Syntax:

    block_type "label" {
    }

Example:

    provider "azurerm" {
    }

Usage: - Used when multiple blocks of the same type exist

------------------------------------------------------------------------

### 3. Block with Two Labels

Syntax:

    block_type "label1" "label2" {
    }

Example:

    resource "azurerm_resource_group" "resource_group" {
    }

Explanation: - label1 → Resource type - label2 → Resource name
(user-defined)

------------------------------------------------------------------------

## Arguments

Arguments define properties inside blocks.

Example:

    resource "azurerm_resource_group" "resource_group" {
      name     = "rg-ssk-001"
      location = "central india"
    }

Argument types:

-   string
-   number
-   list
-   map
-   bool
-   set

Arguments can be: - Required - Optional

------------------------------------------------------------------------

## Terraform Block

Example:

    terraform {
      required_version = ">= 1.0.0"

      required_providers {
        azurerm = {
          source  = "hashicorp/azurerm"
          version = "~> 4.0"
        }
      }
    }

Purpose:

-   Defines Terraform version
-   Defines required providers
-   Specifies provider source and version

------------------------------------------------------------------------

## Provider Block

Example:

    provider "azurerm" {
      features {}
      subscription_id = "your-subscription-id"
    }

Purpose: - Connects Terraform to cloud provider

------------------------------------------------------------------------

## Terraform State File

-   Stores information about created resources
-   File name: `terraform.tfstate`
-   Helps Terraform track infrastructure changes

------------------------------------------------------------------------

## Terraform Lifecycle Commands

### terraform init

Purpose: - Initializes Terraform project - Downloads providers - Creates
`.terraform` folder - Creates `.terraform.lock.hcl`

Command:

    terraform init

To upgrade providers:

    terraform init -upgrade

------------------------------------------------------------------------

### terraform fmt

Purpose: - Formats Terraform code - Improves readability

Command:

    terraform fmt

------------------------------------------------------------------------

### terraform validate

Purpose: - Checks syntax errors - Validates configuration

Command:

    terraform validate

------------------------------------------------------------------------

### terraform plan

Purpose: - Shows execution plan - Displays what will be created,
modified, or deleted

Command:

    terraform plan

------------------------------------------------------------------------

### terraform apply

Purpose: - Creates infrastructure

Command:

    terraform apply

------------------------------------------------------------------------

### terraform destroy

Purpose: - Deletes infrastructure

Command:

    terraform destroy

------------------------------------------------------------------------

## Azure Login Requirement

Before using Azure provider:

    az login

Make sure you have an active subscription.

------------------------------------------------------------------------

## Installing Terraform on Windows

Steps:

1.  Download Terraform zip file
2.  Extract the zip file
3.  Locate `terraform.exe`
4.  Add Terraform path to Environment Variables

Why?

Terraform is a standalone executable. Adding it to PATH allows you to
run it from anywhere.

------------------------------------------------------------------------

## Verify Installation

Command:

    terraform --version

------------------------------------------------------------------------

## Important Files Created

-   `.terraform/` → Provider binaries
-   `.terraform.lock.hcl` → Provider version lock
-   `terraform.tfstate` → State file

------------------------------------------------------------------------

## Terraform Registry

Official registry:

https://registry.terraform.io

Provides:

-   Providers
-   Modules
-   Documentation
-   Examples

------------------------------------------------------------------------

## Summary

Terraform allows you to:

-   Automate infrastructure
-   Use version-controlled configuration
-   Manage multi-cloud environments
-   Track infrastructure using state files
