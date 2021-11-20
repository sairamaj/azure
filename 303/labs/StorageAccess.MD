# Purpose
To see the security of storage account

# Setup
* storage account in Central US
* windows server

# Make Sure one can access blob from windows server
## Steps
* Install storage explorer in windows server
* Expose to storage to internet (All networks)
* Connect through storage explorer
* Create container and blobs

* Result: Success

# Using Virtual network
## Steps
* Disable all network
* Make sure with access key from windows server does not work.
  * Got error as expected: This request is not authorized to perform this operation.
* Enable virtual network at storage
* Added service end point to virtual network
  * ```cmd
    With service endpoints, the source IP address for service traffic from this subnet will switch from using public IPv4 addresses to using private IPv4 address. Existing IP firewall rules using Azure public IP addresses will stop working with this switch. Please ensure IP firewall rules allow for this switch before setting up service endpoints. You may also experience temporary interruption to service traffic from this subnet while configuring service endpoints.
    ```
* Tries to use storage explorer with above changes
* Still got authorization error.
* Looking for diagnostic logs to see why this is happening
* [found](https://docs.microsoft.com/en-us/azure/storage/blobs/monitor-blob-storage?tabs=azure-portal) to monitor the blobs
* You can add storage logs
* send it to
  * Log analytics
  * storage account
  * event hub
  * thirdparty provider

**Found that storage account and virtual network are in different region and hence cannot access**
**Service endpoints work with paired regions (ex: West US2, West Central US)

* Started using storage account within the same region as vnet.
* Storage explorer was able to connect from the server(which is in the vnet) as expectec.

Q: Do we need this "Allow Azure services on the trusted services list to access this storage account, for service endpoint to work"?
* Disabled the trusted services option.
Ans:As expected we don't need the above to be checked for vnet (trusted access is resources whihc will not have vnet [more info](https://docs.microsoft.com/en-us/azure/storage/common/storage-network-security?tabs=azure-portal#grant-access-to-trusted-azure-services))

# Shared Access Signature
* Remove vnet
* Don't allow all networks
* Make sure that we cannot connect from server.
* Failed using access key

## Generate SAS 
[sas terms](https://docs.microsoft.com/en-us/answers/questions/67751/azure-sas-terms.html)

* Read Blob
  * Service: Blob
  * Resource type: Object
  * Permission:

* ex: https://saitest12345.blob.core.windows.net/home/azure.txt?sv=2020-08-04&ss=b&srt=o&sp=r&se=2021-11-22T15:03:38Z&st=2021-11-20T07:03:38Z&spr=https&sig=IPinGRNdA5%2FZ6nBnoXnriQaWI5qP4gTMww8PvzvyFmk%3D
  * sv=version
  * ss=b  (service=blob)
  * srt=o (resource type=o)
  * sp=r  (permission=r)
  * se=end time
  * st=start time
  * sig=signature

**Note:** If your Azure storage account is protected by a virtual network or firewall, you can't grant access by using a SAS token. You'll have to use a managed identity to grant access to your storage resource.

## Interesting observations
* SAS token was not working from windows server even after adding public IP address of the server to storage network. Turned out to be forgotton service end point on the virtual network which might be using Azure public IP instead of server IP. Once removed this left over service endpoint the SAS is working from server (servers IP needs to be added to storage firewall though).




