![Storage](https://docs.microsoft.com/en-us/azure/storage/storage-dotnet-how-to-use-files)

![FileStorage](https://github.com/sairamaj/azure/blob/master/images/filestorage.png)

### Steps
* Create storage account through portal
* $ctx = New-AzureStorageContext "stroageaccthere" 'accessKey'
* Get-AzureStorageShare  'sharename' -Context $ctx
* New-AzureStorageShare 'sharename' -Context $ctx 
* New-AzureStorageDirectory -Share $storage -Path "directoryname"
* Set-AzureStorageFileContent -Share $s -Source C:\temp\Log1.txt -Path CustomLogs



