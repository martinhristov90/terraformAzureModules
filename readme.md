## This reposistory is created with learning purposes for Terraform, focusing on AzureRM provider.

## Purpose :

- It provides a simple example of how to use modules (local and Terraform Registry) and to create a simple Linux VM in Azure using Terraform.

## How to install terraform : 

- The information about installing terraform can be found on the HashiCorp website 
[here](https://learn.hashicorp.com/terraform/getting-started/install.html)
- Instructions how to install `Azure-CLI` can be found [here](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-macos?view=azure-cli-latest), if the method for authentication chosen by you requires it.

## How to use it :

- In a directory of your choice, clone the github repository :
    ```
    git clone https://github.com/martinhristov90/terraformAzureModules.git
    ```

- Change into the directory :
    ```
    cd terraformAzureModules
    ```

- In order to use `AzureRM` provider, you need to authenticate, there are several methods listed [here](https://www.terraform.io/docs/providers/azurerm/auth/service_principal_client_secret.html).

- You might need to change some variables in `terraform.tfvars` file to fit your needs, the defaults are listed here :
  ```
  location = "westeurope"
  os = "UbuntuServer"
  RGname = "trainingRG"
  ```

- Run `terraform init` to download needed dependencies.

- Run `terraform plan`, it is going to create a plan of the resources to be created. The output should look like this :
  ```
  ---SNIP---
  Plan: 10 to add, 0 to change, 0 to destroy.
  ---SNIP---
  ```

- Now you can run `terraform apply` to actually create resources in Azure. Your output should look like this :
  ```
  Apply complete! Resources: 10 added, 0 changed, 0 destroyed.

  Outputs:

  public_dns = [
      linux1234.westeurope.cloudapp.azure.com
  ]
  ```
  
- You can verify using the web interface of Azure, that all resources are created within RG named "trainingRG". The easiest way to find the resources is by using the tag they have been given, it is "environment="trainingENV"

- In order to destroy the created resources, you can use `terraform destroy`.