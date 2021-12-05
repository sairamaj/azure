# Purpose
* Monitoring SQL

# Steps
* Created SQL database
*  SQL server name should be unqiue
![setup](.\Setup1.PNG)
![setup](.\Setup2.PNG)
![setup](.\Setup3.PNG)

## SSMS
* Connected: sai-sqlserver-304.database.windows.net,1433 (need to enable client ip in firewall) using SQL 
* sai-sqlserver-304.database.windows.net,1433
* created table
```sql
CREATE TABLE Task (
    Id int,
    Name varchar(255)
);
```
* populated 2 rows
```sql
insert into task values(1,'Task1')
insert into task values(2,'Task2')
```

# Audit log
* Created log analytics workspace lg-for-sql
* Enabled Audit log for database from portal
* Viewed the audit logs through portal
![results](.\AuditLogResults.PNG)

# Observations
* vCore Provisioned cost is high (as in this case we will be using just for test purpose)
* Changed to vCore ServerLess Cost came down (In reality serverless per unit is more compared to Provisioned one. see in the reference.)

# Resources
[vCore vs DTU](https://docs.microsoft.com/en-us/azure/azure-sql/database/purchasing-models)
[SQL .NET Core](https://docs.microsoft.com/en-us/azure/azure-sql/database/connect-query-dotnet-core)