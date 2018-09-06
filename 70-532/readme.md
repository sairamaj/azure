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