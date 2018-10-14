    [Microsoft learning](https://www.microsoft.com/en-us/learning/default.aspx)
    [Borntolearn](https://www.microsoft.com/en-us/learning/community.aspx)
   
   Book:  Developing Microsoft Azure solutions  
   AzCopy  
   Azure Storage Emulator  
   Azure Storage Explorer  
   [Practice tests](https://www.measureup.com/microsoft-technical.html)  
   The science of successful learning  

   # Web
   ## App Services
   ### App types    
   * Web apps
   * Mobile apps
   * Api apps
   * Logic apps

   ### Deployment slots
   * swap to rollback
   * some settings travel with slot and some don't when you swap.
### Publising from visual studio
* From portal Get publish profile
* Use import in visual studio and give the downloaded profile.

### Methods for publishing
* FTP
* Visual Studio
* Powershell web deploy packae
* Local SCM (Git)
* Cloud SCM (VSTS, GitHub
* With REST api

### Publishing with package
- From visual studio create web package (which creates zip file)
- Use following powershell to deploy
```powershell
# the following are  using ASM versions (not ARM)
Add-AzureAccount
Get-AzureSubscription
Set-AzureSubscription -SubscriptionId <id>
Publish-AzureWebsiteProject -Name sairamaweb -Package C:\temp\techtips\TechTips.zip
```
## Service Plans
* Name
* Resource group
* Location
* Pricing Plans (need to know in detail for exam.)
* Reusable (can be associate apps from other region)
* Plans
    * Free
    * Shared
    * Basic
    * Standard
    * Premium

explore 
* Pricing calculator
* Azure quick start templates
* FileZilla
* A name vs CNAME

things to do
* deploy
    * use ftp
    * use package
    * use visuals studio
* kudu

### Log sources
* Event Log(XML) (event logs from VM )
* IIS Web server log
* Detail error message logs (HTML)
* Failed Request Tracing logs (FREB)
* App diagnostics logs (done in code.)

#### Log file locations
* Application diagnostic log location: d:\home\logfiles\application
* Web server logs d:\home\logfiles\http\rawlogs
* Details errors: d:\home\logfiles\detailederrors
* Failed request traces: d:\home\logfiles\w3svc<>

#### Retriving logs
* Azure Portal (Blob,Table)
* Site Control Manager (kudu)
* FTP(s)
* Azure App web log browser/Event Viewer(kudu)
* Visual studio (Server explorer)
* Widows powershell
    ```powershell
        Save-AzureWebsiteLog -Name <name> -Output <zip file>
    ```

#### Streaming Logs
```powershell
    Get-AzureWebSiteLog -name <name> --Tail --Message Error
```
DaaS (Diagnostics as Service)

#### Webhooks
File types supporeted, (com,.bat, .exe, .sh , ps1, .js, .php)

#### Patterns
* Retry pattern

Use Azure quick start templates

## Virtual machines
### Alerts
* Metrics based (ex: cpu)
* Activity based (ex:reboot)

## dev test labs
* [artifacts](https://github.com/Azure/azure-devtestlab)
* policies
* create images
* formulas (reusable bases)
* cost tracking
* target costs/alerts (per resources, monthly basis)
* IAM 
* claim and unclaim
[howto](https://www.starwindsoftware.com/blog/how-to-use-azure-devtest-labs)
[demo](https://github.com/gxy001/azure-devtestlabsdemo)

## High available
[load balancer vs gateway when to use](https://blog.siliconvalve.com/2017/04/04/when-to-use-azure-load-balancer-or-application-gateway/)
* [Availability sets] (https://docs.microsoft.com/en-us/azure/virtual-machines/windows/manage-availability)
    * Fault domain (share the same powersupply and network switc) (un planned)
    * Update domain

Note: First create availability sets and then create virtual machine in it (not the otherway)

Load balancer: backend pool -> availability set.  
Health probes on Load balancer.

Load balancer rule-> floating ip(exam)  
Gateway is more for web (web app firewall, cookie bases session affinity, ssl offload, url based routing,multi site routing)  
[architecture ref](https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/n-tier/n-tier-sql-server)

[learning more must visit](https://docs.microsoft.com/en-us/learn/azure/)
## Storage
* blob  (binary lart object - unstructed data)
    * page blobs (vhds, optimized for read and write)
    * block blobs ( images, movies , stored in blocks)
    * append blobs ( text files, log files)  

* blob metadata

* storage account - globally unique.
    * storage account => containers => blobs
* Storage explorer  
* There is no hiearchy built but one can simulate using the pats in the blobs. (for ex: name can be sub/images/image1.png)

* CDN
    * Edge servers, Point of Presense(POP)

## developing in C#
* Microsoft.WindowsAzure.ConfigurationManager (nuget)
## Tables
* Non relational
* Storage account => tables => entities (collection of properties)
* Partition key, row key.
* OData (Rest based protocol)

## Queues
* Asynchronous messaging system.
* Storage account => Queues => Messages

## Storage access
* Shared access signature.
* Policy  

[DTU calculator](dtucalculator.azrewebsites.net)

## Azure AD
[AD libraries](https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-authentication-libraries)
* Protocols
    * WS Federation (Enterprise)
    * SAML-p 2.0  (Enterprise) 
    * OAuth 2.0 (Authorization)
    * OpenID Connect (Authentication)
    * [WS Federation Sample](https://github.com/Azure-Samples/active-directory-dotnet-webapp-wsfederation)

Microsoft Graph api vs Azure Graph Api

Key Valut  
*   Managed Service Identity (Virtual machine) -> In Configuratio (as extension)
    * allows virtual machine to access to secrets in the key valut.  

Azure Key Vault service limits.

## Service Bus
* Queue
    * One directional
* Topics
    * Subscriptions
* Relays
    * Bi directional

## App Service    
### Choosing a service plan  
Function apps may use one of two types of service plans. The first service plan is the __Consumption service plan__. This is the plan that you choose when using the Azure serverless application platform. The Consumption service plan provides automatic scaling and bills you when your functions are running. The Consumption plan comes with a configurable timeout period for the execution of a function. By default, it is 5 minutes, but may be configured to have a timeout as long as 10 minutes.  

The second plan is called the __Azure App Service plan__. This plan allows you to avoid timeout periods by having your function run continuously on a VM that you define. When using an App Service plan, you are responsible for managing the app resources the function runs on, so this is __technically not a serverless plan__. However, it may be a better choice if your functions are used continuously or if your functions require more processing power or execution time than the Consumption plan can provide.

### Storage account requirements
When you create a function app, it must be linked to a storage account. You can select an existing account or create a new one. The function app uses this storage account for internal operations such as logging function executions and managing execution triggers. On the Consumption service plan, this is also where the function code and configuration file are stored.

[Function bindings](https://docs.microsoft.com/en-us/learn/modules/create-serverless-logic-with-azure-functions/4-creating-and-executing-an-azure-function)