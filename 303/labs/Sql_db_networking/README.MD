# Goal
Explore networking options for SQL Database

# Setup
## VM1
|  Resource |    |
|-----------|----|
|Resource Group| rg-east-sqllearn|
|Region| East|
|Virtual Machine| vm-east-sqllearn-vm1|
|VNet| vnet-east-sqllearn|
|tags | env=lab purpose=sql-learn|

## VM2
|  Resource |    |
|-----------|----|
|Resource Group| rg-west-sqllearn|
|Region| West|
|Virtual Machine| vm-west-sqllearn-vm1|
|VNet| vnet-west-sqllearn|
|tags | env=lab purpose=sql-learn|

## SQL DB
|  Resource |    |
|-----------|----|
|Resource Group| rg-central-sqllearn|
|Region| Central|
|SQL DB| sqldb-central-sqllearn|
|tags | env=lab purpose=sql-learn|

Connection string: sql-saitest.database.windows.net

# Steps
* Install management studio on VM1,VM2

## Testing
### Connection
* From Azure VM
  * Connection failed
  * Enabled Firewall Azure allow acceses
  * Connection succeeded
  * select client_net_address from  sys.dm_exec_connections where session_id=@@spid
    * Showed the public ip (public ip resource of vm)
  * Showed the ip address of the VM
  * Disabled the Azure allow access
  * Connection failed
  * Virtual network-> Service end point created

Found that virtual service endpoints does not work across region. Our VM and SQL db are in different regions. 
[https://docs.microsoft.com/en-us/azure/azure-sql/database/vnet-service-endpoint-rule-overview](virtual network service endpoints)


# Observations
Q: How do we allow public access?


