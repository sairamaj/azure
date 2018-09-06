[Storage Account](https://docs.microsoft.com/en-us/azure/storage/storage-introduction)
![Azure storage concepts](https://github.com/sairamaj/azure/blob/master/storage-concepts.png)

## Azure Automation
* Automate process using run books
* Automate configuration management using Desired State Configuration
* Provides a way for users to automate the manual, long-running, error-prone, and frequently repeated tasks that are commonly performed in a cloud and enterprise environment
* Through portal search for Automation

### Run book
* A set of tasks that perform some automated process in Azure Automation.
* Powershell, Powershell workflow

### __D__ esired __S__ tate __C__ configuration
* Is a management platform that allows you to manage, deploy and enforce configuration for physical hosts and virtual machines using a declarative PowerShell syntax.

## Powershell commands
### Remove resource group
``` powershell
    Login-AzureRmAccount
    Remove-AzureRmResourceGroup Demos
```


[Documentation](https://docs.microsoft.com/en-us/azure/automation/)

[Getting Started](https://azure.microsoft.com/en-us/blog/azure-automation-runbook-management/)

[Learning key Windows PowerShell Workflow concepts for Automation runbooks](https://docs.microsoft.com/en-us/azure/automation/automation-powershell-workflow)


# Azure Storage Explorer

[Table creation](https://docs.microsoft.com/en-us/azure/storage/storage-dotnet-how-to-use-tables)

## VM Extensions
Azure virtual machine extensions are small applications that provide post-deployment configuration and automation tasks on Azure virtual machines. For example, if a virtual machine requires software installation, anti-virus protection, or Docker configuration, a VM extension can be used to complete these tasks.

[Azure-Automation: Run tasks on Azure Virtual Machines - without opening ports](https://azure.microsoft.com/en-us/blog/azure-automation-run-tasks-on-azure-virtual-machines-without-opening-ports/)

### Installing Azure modules
* Install-Module AzureRM
    * In order this to work you should have Powershell gallery in the repository
    * You can check by executing the Get-PSRepository
    * If you don't find it then use Set-PSRepository -SourceLocation https://www.powershellgallery.com/api/v2/ -Name "psgallery" -InstallationPolicy Trusted

[Azure Active Directory for Developers](https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-developers-guide)

[Azure Tenant means](https://msdn.microsoft.com/library/azure/jj573650.aspx#BKMK_WhatIsAnAzureADTenant)
[Authorization in a web app using Azure AD application roles & role claims](https://azure.microsoft.com/en-us/resources/samples/active-directory-dotnet-webapp-roleclaims/)

# Exposing the RDP 3389 to port say 22
* Crate Load balancer
    * Add Inbound NAT rule and use map 22 -> 3389
    * Select virtual machine(s)
    * Now you can login to virtual machine with port 22

[CLI vs Powershell](https://blogs.msdn.microsoft.com/premier_developer/2017/11/02/choosing-the-right-tooling-for-azure-and-side-by-side-azure-cli-and-powershell-commands/)
