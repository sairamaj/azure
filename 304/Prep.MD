# Monitoring
# Cost Management

# SQL Database

* Use point-in-time restore to recover from human error by returning the database to an earlier point in time.
* Use geo-restore to recover from a service outage by restoring a database from a geo-redundant backup.

[Query performance insights](https://docs.microsoft.com/en-us/azure/azure-sql/database/query-performance-insight-use)

____


# App Service
Avoid using the App Service backup feature to back up your SQL databases because it exports the database to a SQL BACPAC file, consuming DTUs. Instead, use SQL Database point-in-time restore

# **B**usiness **C**ontinutity **D**isastor **R**ecovery
## SQL Database
* To protect your business from data loss, SQL Database and SQL Managed Instance automatically create full database backups weekly, differential database backups every 12 hours, and transaction log backups every 5 - 10 minutes. The backups are stored in RA-GRS storage for at least seven days for all service tiers. All service tiers except Basic support configurable backup retention period for point-in-time restore, up to 35 days

[Automatic Tuning](https://docs.microsoft.com/en-us/azure/azure-sql/database/automatic-tuning-overview)

____

# Azure Active Directory

*idFix identifies errors such as duplicates and formatting problems in your Active Directory Domain Services (AD DS) domain before you synchronize to Office 365.
## SSPR
* [Recommendations](https://docs.microsoft.com/en-us/learn/modules/allow-users-reset-their-password/2-self-service-password-reset)
# Resources
[304 certification](https://charbelnemnom.com/passed-az-304-exam-microsoft-azure-architect-design/)

* Management groups can't span AAD tenant

[configure aad to internal application](https://thesleepyadmins.com/2019/02/09/configure-azure-application-proxy-access-internal-application/)
[MFA to custom app](https://thesleepyadmins.com/2019/02/10/configure-mfa-for-azure-application-proxy/)

[state parameter usage in asp.net for openid](https://blogs.aaddevsup.xyz/2019/11/state-parameter-in-mvc-application/)

[Alert on User Login](https://4sysops.com/archives/how-to-create-an-azure-ad-admin-login-alert/)

____

# Azure Cost
* People with Cost Management Contributor (or greater) access can create shared views. You can create up to 50 shared views per scope.

* Anyone can save up to 50 private views, even if they only have read access. These views cannot be shared with others directly in cost analysis, but they can be pinned to a dashboard or shared via URL so others can save a copy.

* You can optionally include up to five thresholds and five email addresses in a single budget

* Alert Types
  * Budget -> all accounts
  * Credit -> Enterprise agreement 
  * Department spending -> Enterprise agreement
* Types of subscriptions
  * Free trial
  * Pay-as-you-go
  * Member offers
* Purchasing Azure Services
  * Through an Enterprise Agreement
  * Directly from the web
  * Through a Cloud Solution Provider

* Resource Cost
  * Region
  * Tier
  * Billing Options
  * Support Options
  * Program and offers
  * Azure Dev/Testing pricing

* Azure Advisor identifies unused or underutilized resources and recommends unused resources that you can remove

____


# Azure Cost
* [Spending limit](https://docs.microsoft.com/en-us/azure/cost-management-billing/manage/spending-limit)
  * For Free account
  * Not applicable for Commit Plans or Pay as You GO

____

# BluePrint
* When a blueprint is first created, it's considered to be in Draft mode. When it's ready to be assigned, it needs to be Published.

* Blueprint difference with ARM template
  * Nearly everything that you want to include for deployment in Azure Blueprints can be accomplished with an ARM template. However, an ARM template is a document that doesn't exist natively in Azure - each is stored either locally or in source control. The template gets used for deployments of one or more Azure resources, but once those resources deploy there's no active connection or relationship to the template.

  * With Azure Blueprints, the relationship between the blueprint definition (what should be deployed) and the blueprint assignment (what was deployed) is preserved. This connection supports improved tracking and auditing of deployments. Azure Blueprints can also upgrade several subscriptions at once that are governed by the same blueprint

  ____

# Azure Monitor
* Archiving logs and metrics to an Azure storage account is useful for audit, static analysis, or backup. Compared to Azure Monitor Logs and a Log Analytics workspace, Azure storage is less expensive and logs can be kept there indefinitely."

* The storage account needs to be in the same region as the resource being monitored if the resource is regional."

____

# Azure Data Factory
* Azure Data Factory is the platform that solves such data scenarios. It is the cloud-based ETL and data integration service that allows you to create data-driven workflows for orchestrating data movement and transforming data at scale. Using Azure Data Factory, you can create and schedule data-driven workflows (called pipelines) that can ingest data from disparate data stores. You can build complex ETL processes that transform data visually with data flows or by using compute services such as Azure HDInsight Hadoop, Azure Databricks, and Azure SQL Database

* The Integration Runtime (IR) is the compute infrastructure used by Azure Data Factory and Azure Synapse pipelines to provide the following data integration capabilities across different network environments
  * Data Flow
  * Data movement
  * Activity dispatch
  * SSIS package execution.
* Types of IR
  * Azure
  * Self-hosted
  * Azure-SSIS

* To create Data Factory instances, the user account that you use to sign in to Azure must be a member of the __contributor__ role, the __owner__ role, or an __administrator__ of the Azure subscription.
* To create and manage child resources in the Azure portal, you must belong to the __Data Factory Contributor__ role at the Resource Group level or above.

* Copy Activity
  * [pre requsites](https://docs.microsoft.com/en-us/azure/data-factory/connector-file-system?tabs=data-factory#prerequisites)
  * Supported file formats
    * Avro, Binary, Delimited, Excel, Json,ORC, Parquet, XML



____

# Azure CosmoDB
* Change feed in Azure Cosmos DB 
  * is a persistent record of changes to a container in the order they occur.
  * is only for insert and updates (and not deletes)
  * use soft marker for getting deletes (and also to differentiate update from inserts)
  * Function apps support triggers for CosmosDB, logic apps do not

* Migration
  * SON files, CSV files, SQL, MongoDB, Azure Table storage, Amazon DynamoDB, and even Azure Cosmos DB SQL API collections
  * Table API - You can use the Data Migration tool or AzCopy to import data. For more information, see Import data for use with the Azure Cosmos DB Table API.
  * dt.exe and dtui.exe
____

# Disks
* High Scale VMs that leverage Azure Premium Storage have a multi-tier caching technology called BlobCache. BlobCache uses a combination of the host RAM and local SSD for caching. This cache is available for the Premium Storage persistent disks and the VM local disks. By default, this cache setting is set to Read/Write for OS disks and ReadOnly for data disks hosted on Premium Storage. With disk caching enabled on the Premium Storage disks, the high scale VMs can achieve extremely high levels of performance that exceed the underlying disk performance.

* Disk Caching is not supported for disks 4 TiB and larger. If multiple disks are attached to your VM, each disk that is smaller than 4 TiB will support caching.
* Defaults
  * OS disk	- ReadWrite
  * Data disk	- ReadOnly
* Recommendations for data disks
  * None	- Configure host-cache as None for write-only and write-heavy disks.
  * ReadOnly	- Configure host-cache as ReadOnly for read-only and read-write disks.
  * ReadWrite	- Configure host-cache as ReadWrite only if your application properly handles writing cached data to persistent disks when needed.
[disk caching]  (https://docs.microsoft.com/en-us/azure/virtual-machines/premium-storage-performance#disk-caching)

____

# SQL Server VM
* The SQL Assessment feature of the Azure portal identifies possible performance issues and evaluates that your SQL Server on Azure Virtual Machines (VMs) is configured to follow best practices using the
[Performance recommendations](https://docs.microsoft.com/en-us/azure/azure-sql/virtual-machines/windows/performance-guidelines-best-practices-checklist#vm-size)
* Place data, log, and tempdb files on separate drives
* Register with the SQL IaaS Agent Extension to unlock a number of feature benefits.

____

# Sql Database (managed)
[pool overview](https://vincentlauzon.com/2016/12/18/azure-sql-elastic-pool-overview/)
* the compute sits with the database and not the server.  The edition (i.e. Basic, Standard & Premium) & Pricing Tier / DTUs are set at the database level, not the server level.  Actually, the server doesn’t even have a cost associated to it

* vCore-based purchasing model is available for both Azure SQL Database and Azure SQL Managed Instance. The Hyperscale service tier is available for single databases that are using the vCore-based purchasing model. (independent compute, storage, io )
* DTU-based purchasing model is available for Azure SQL Database (compute, storage, i/o bundled)
* **vCore-based**	This model allows you to independently choose compute and storage resources. The vCore-based purchasing model also allows you to use Azure Hybrid Benefit for SQL Server to **save costs**

____

# Azure Key Vault
[throttling] (https://docs.microsoft.com/en-us/azure/key-vault/general/overview-throttling)


