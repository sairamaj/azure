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