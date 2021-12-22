# Monitoring
* Diagnostic Extension
  * [overview](https://docs.microsoft.com/en-us/azure/azure-monitor/agents/diagnostics-extension-overview)
  * Windows Diagnostcis Extension(WAD)
  * LAD(Linux Diagnostic Extension)
* Log Analytics Extension
  * [overview](https://docs.microsoft.com/en-us/azure/azure-monitor/agents/log-analytics-agent)

[diff from Diagnostic vs Log Anaylytics agent](https://docs.microsoft.com/en-us/azure/azure-monitor/agents/diagnostics-extension-overview#comparison-to-log-analytics-agent)

[vm insights](https://docs.microsoft.com/en-us/azure/azure-monitor/vm/vminsights-overview)
VM insights monitors the performance and health of your virtual machines and virtual machine scale sets, including their running processes and dependencies on other resources. It can help deliver predictable performance and availability of vital applications by identifying performance bottlenecks and network issues and can also help you understand whether an issue is related to other dependencies.

* In the most basic of scenarios where you don't need any threshold-based orchestration, you could directly call the automation script from Monitor and skip the Logic App step. [reference](https://docs.microsoft.com/en-us/azure/cost-management-billing/manage/cost-management-budget-scenario)

* You can use the **Service Connectivity Monitor** capability in Network Performance Monitor to monitor network connectivity to any endpoint that has an open TCP port. Such endpoints include websites, SaaS applications, PaaS applications, and SQL databases
[service connectivity monitor](https://docs.microsoft.com/en-us/azure/azure-monitor/insights/network-performance-monitor-service-connectivity)

* Network Performance Monitor
  * [overview](https://docs.microsoft.com/en-us/azure/azure-monitor/insights/network-performance-monitor)
  * Network Performance Monitor is a cloud-based hybrid network monitoring solution that helps you monitor network performance between various points in your network infrastructure. It also helps you monitor network connectivity to service and application endpoints and monitor the performance of Azure ExpressRoute
  * Three borad categories
    * Performance Monitor
    * Service Connectivity
    * ExpressRoute Monitor

* Trafic Analytics
  * Traffic Analytics is a cloud-based solution that provides visibility into user and application activity in cloud networks. Traffic analytics analyzes Network Watcher network security group (NSG) flow logs to provide insights into traffic flow in your Azure cloud.
  * [overview](https://docs.microsoft.com/en-us/azure/network-watcher/traffic-analytics)

* Service Map
  * Log analytics agent
  * Dependency agent
  * Log analytics work space
_____

# Cost Management

_______

# SQL Database

* Use point-in-time restore to recover from human error by returning the database to an earlier point in time.
* Use geo-restore to recover from a service outage by restoring a database from a geo-redundant backup.

[Query performance insights](https://docs.microsoft.com/en-us/azure/azure-sql/database/query-performance-insight-use)

* Auditing
 * database events and writes them to an audit log in your Azure storage account, Log Analytics workspace, or Event Hubs.
[server vs database auditing](https://docs.microsoft.com/en-us/azure/azure-sql/database/auditing-overview#server-vs-database-level)

* Be sure that the event hub is in the same region as your database and server.
* Auditing for storage account should be in the same region.

[Serverless scenario](https://docs.microsoft.com/en-us/azure/azure-sql/database/serverless-tier-overview#scenarios-well-suited-for-serverless-compute)
[Provisioned computer scenario](https://docs.microsoft.com/en-us/azure/azure-sql/database/serverless-tier-overview#scenarios-well-suited-for-provisioned-compute)
[Comparision of serverless and provisioned](https://docs.microsoft.com/en-us/azure/azure-sql/database/serverless-tier-overview#scenarios-well-suited-for-provisioned-compute)

* Azure SQL Analytics is a cloud-only monitoring solution supporting streaming of diagnostics telemetry for all of your Azure SQL databases. Because Azure SQL Analytics does not use agents to connect to Azure Monitor, it does not support monitoring of SQL Server hosted on-premises or in virtual machines.

* Firewall rules
 * [overview] (https://docs.microsoft.com/en-us/azure/azure-sql/database/firewall-configure#server-level-versus-database-level-ip-firewall-rules)
 * use database-level IP firewall rules whenever possible. This practice enhances security and makes your database more portable. Use server-level IP firewall rules for administrators. Also use them when you have many databases that have the same access requirements, and you don't want to configure each database individually
 * Database-level IP firewall rules can only be configured through Transact-SQL.
 * Connections from inside Azure
   * Allow Azure Services and resources to access this server to ON in the Firewalls and virtual networks settings. Switching the setting to ON creates an inbound firewall rule for IP 0.0.0.0 - 0.0.0.0 named AllowAllWindowsAzureIps
* Azure AD authentication
  * [overview](https://docs.microsoft.com/en-us/azure/azure-sql/database/authentication-aad-configure?tabs=azure-powershell#create-contained-users-mapped-to-azure-ad-identities)
  * Azure Active Directory with geo-replication, the Azure Active Directory administrator must be configured for both the primary and the secondary servers. If a server does not have an Azure Active Directory administrator, then Azure Active Directory logins and users receive a Cannot connect to server error
  * SQL Managed Instance supports Azure AD server principals (logins), using contained database users is not required. Azure AD server principals (logins) enable you to create logins from Azure AD users, groups, or applications
  * Azure Active Directory authentication with SQL Database and Azure Synapse requires using contained database users based on an Azure AD identity

* Archiectural models
  * General Purpose/Standard
    * Compute and Storage separated
    * Uses Blob storage for database files
    * 5-10ms latency 
  * Business Critial/Premimum
    * [info](https://docs.microsoft.com/en-us/azure/azure-sql/database/service-tier-business-critical)
    * Compute and Storage integrated.
    * Low latency (1 to 2 ms)
    * fast recovery
    * designed for intensive workloads that cannot tolerate any performance impact due to the ongoing maintenance operations
    * Built-in Read Scale-Out for free of charge for built-in read only
    * Uses Always On Availability Group
    * Offload reports
  
  * HyperScale
    * Only avaialble for SQL database (not in managed instance)

____


# App Service
Avoid using the App Service backup feature to back up your SQL databases because it exports the database to a SQL BACPAC file, consuming DTUs. Instead, use SQL Database point-in-time restore

# **B**usiness **C**ontinutity **D**isastor **R**ecovery
## SQL Database
* To protect your business from data loss, SQL Database and SQL Managed Instance automatically create full database backups weekly, differential database backups every 12 hours, and transaction log backups every 5 - 10 minutes. The backups are stored in RA-GRS storage for at least seven days for all service tiers. All service tiers except Basic support configurable backup retention period for point-in-time restore, up to 35 days

[Automatic Tuning](https://docs.microsoft.com/en-us/azure/azure-sql/database/automatic-tuning-overview)

* VNet integration
  * [overview](https://docs.microsoft.com/en-us/azure/app-service/overview-vnet-integration)

[files](https://github.com/projectkudu/kudu/wiki/Understanding-the-Azure-App-Service-file-system)
[configuration](https://github.com/projectkudu/kudu/wiki/Configurable-settings#turning-on-the-dynamic-cache-feature)
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

[Admin changing profile](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-users-profile-azure-portal)

[Integate ad logs in to azure monitor](https://docs.microsoft.com/en-us/azure/active-directory/reports-monitoring/howto-integrate-activity-logs-with-log-analytics)

* Licenses: Free, Office 365 apps, Premium P1, and Premium P2
* Premium P1
  * Designed to empower organisations with more demanding identity and access management needs, Azure Active Directory Premium edition adds feature-rich enterprise-level identity management capabilities and enables hybrid users to seamlessly access on-premises and cloud capabilities. This edition includes everything you need for information worker and identity administrators in hybrid environments across application access, self-service identity and access management (IAM) and security in the cloud.

* Premium P2
  * Azure Active Directory Premium P2 includes every feature of all other Azure Active Directory editions enhanced with advanced identity protection and privileged identity management capabilities.

* License
  * [PIM License scenario](https://docs.microsoft.com/en-us/azure/automation/overview#common-scenarios)
  * Elgible roles + Approvers + Reviewers.

[Federated authentication for Web](https://www.youtube.com/watch?v=CjarTgjKcX8)

* SSO
  * Federation
  * Password
    * On-premises applications can use a password-based method for SSO. This choice works when applications are configured for Application Proxy.With password-based SSO, users sign in to the application with a username and password the first time they access it. After the first sign-on, Azure AD provides the username and password to the application
  * Linked
  
## ADDS
[overview](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/auth-ldap)
* Integrated with Azure AD
* Managed service

[onetime bypass mfa](https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-server-settings#one-time-bypass)

[PIM alerts](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-configure-security-alerts?tabs=new)
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

* Resource locking
  * [details](https://docs.microsoft.com/en-us/azure/governance/blueprints/concepts/resource-locking)
    *  If the assignment was set with the Read Only or Do Not Delete option, not even the subscription owner can perform the blocked action on the protected resource.
  * [removing locking states](https://docs.microsoft.com/en-us/azure/governance/blueprints/concepts/resource-locking#removing-locking-states)
    * Updating the blueprint assignment to a locking mode of Don't Lock
    * Delete the blueprint assignment
  ____

# Azure Monitor
* Archiving logs and metrics to an Azure storage account is useful for audit, static analysis, or backup. Compared to Azure Monitor Logs and a Log Analytics workspace, Azure storage is less expensive and logs can be kept there indefinitely."

* The storage account needs to be in the same region as the resource being monitored if the resource is regional."

[log analytics cost](https://docs.microsoft.com/en-us/azure/azure-monitor/logs/manage-cost-storage#changing-pricing-tier)

[log analytics for service provider](https://docs.microsoft.com/en-us/azure/azure-monitor/logs/service-providers#architectures-for-service-providers)

[Visulation options](https://docs.microsoft.com/en-us/azure/azure-monitor/best-practices-analysis#azure-dashboards)
* Dashboard has RBAC and sharing feature
* Dashboards enable you to visualize cloud and on-prem data
* Dashboard can auto refresh.
* Grafana open source to include multi cloud, on premises.
* Workbooks does not have auto refresh

[monitoring](https://cloud.netapp.com/blog/azure-monitoring-dashboard-3-options-and-their-pros-cons)

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

* Parameterization
  * Parameters
  * Variables
  * Expressions
* Triggers
  * Scheduled
    * Interval
    * Specific hours
    * Specific week days
    * Specific months days
  * Tumbling window triggers
    * Frequency
    * Retry
    * Retry policy
    * Delay
    * Max concurrency
    * Dependencies
  * Event based
  * Manual
* Mapping Data Flow
  * way to transform data at scale without any coding required.

* Self Integrated Runtime does not support Data Flow but does Data movement.

[sql sspackage](https://docs.microsoft.com/en-us/sql/integration-services/lift-shift/ssis-azure-lift-shift-ssis-packages-overview?view=sql-server-ver15)


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
  * [cosmdb migration tool](https://docs.microsoft.com/en-us/azure/cosmos-db/import-data)
  * Azure **Database Migration Service** to perform an offline (one-time) migration of databases from an on-premises or cloud instance of MongoDB to Azure Cosmos DB's API for MongoDB. 
  * The Data Migration tool doesn't support Azure Cosmos DB's API for MongoDB either as a source or as a target. If you want to migrate the data in or out of collections in Azure Cosmos DB, refer to How to migrate MongoDB data to a Cosmos database with Azure Cosmos DB's API for MongoDB for instructions. You can still use the Data Migration tool to export data from MongoDB to Azure Cosmos DB SQL API collections for use with the SQL API.
  * Not supported for Casandra ([for casandra](https://docs.microsoft.com/en-us/azure/cosmos-db/cosmosdb-migrationchoices#azure-cosmos-db-cassandra-api)), Gremlin APIs [gremlin](https://docs.microsoft.com/en-us/azure/cosmos-db/cosmosdb-migrationchoices#other-apis).

* Secure Access Data
  * Primary/Secondary Key
  * RBAC
  * Resource Tokens

* Backup
  * Continuous backup mode
  * Periodic backup mode
    * Max retention period: 1month
    * Min backup internval: 1hr
* Managed Identity
  * [overview](https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/tutorial-windows-vm-access-cosmos-db)
  * Cosmos DB does not natively support Azure AD authentication
  * System-assigned managed identity to retrieve a Cosmos DB access key from Resource Manager, and use the key to access Cosmos DB
  * Kind of workaround.
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

[disk types](https://docs.microsoft.com/en-us/azure/virtual-machines/disks-types#bursting)
[premium disk bursting](https://docs.microsoft.com/en-us/azure/virtual-machines/disks-types#premium-ssd-bursting)
[standard disk bursting](https://docs.microsoft.com/en-us/azure/virtual-machines/disks-types#premium-ssd-bursting)

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

* Automatic backups are: 7-35 days.

[long term retension](https://docs.microsoft.com/en-us/azure/azure-sql/database/long-term-retention-overview)
* The LTR backups are only created when the secondary becomes primary

* [dynamic masking](https://docs.microsoft.com/en-us/azure/azure-sql/database/dynamic-data-masking-overview)

* Diagnostics
  * In portal when retension policy specified for SQL database diganostics it is applicable to storage
  * In Log analytics the retension is anywhere between 1-730(2years)
____

# SQL Managed instance

* Service Broker
  * SQL Server Service Broker provide native support for messaging and queuing in the SQL Server Database Engine and Azure SQL Managed Instance. Developers can easily create sophisticated applications that use the Database Engine components to communicate between disparate databases, and build distributed and reliable applications.

* Database Mail
  * Database mail is available in SQL Server Database Engine and Azure SQL Managed Instance, but not in Azure SQL database Singleton and Elastic pools.
  * Database Mail is an enterprise solution for sending e-mail messages from the SQL Server Database Engine or Azure SQL Managed Instance. Using Database Mail, your database applications can send e-mail messages to users. The messages can contain query results, and can also include files from any resource on your network.
 
* Linked Servers
  * Linked servers are available in SQL Server Database Engine and Azure SQL Managed Instance. They are not enabled in Azure SQL Database singleton and elastic pools. 
  * Linked servers enable the SQL Server Database Engine and Azure SQL Managed Instance to read data from the remote data sources and execute commands against the remote database servers (for example, OLE DB data sources) outside of the instance of SQL Server. Typically linked servers are configured to enable the Database Engine to execute a Transact-SQL statement that includes tables in another instance of SQL Server, or another database product such as Oracle. Many types OLE DB data sources can be configured as linked servers, including third-party database providers and Azure CosmosDB.


____
# Azure Key Vault
[throttling] (https://docs.microsoft.com/en-us/azure/key-vault/general/overview-throttling)

[backup](https://docs.microsoft.com/en-us/azure/key-vault/general/backup?tabs=azure-cli)
* Restore the blob into a key vault within the same Azure subscription and Azure geography.

[DR](https://docs.microsoft.com/en-us/azure/key-vault/general/disaster-recovery-guidance)

* ARM template and KV
  * the key vault can exist in a different subscription than the resource group you're deploying to
  * The user who deploys the template must have the Microsoft.KeyVault/vaults/deploy/action permission for the scope of the resource group and key vault. By checking this access, Azure Resource Manager prevents an unapproved user from accessing the secret by passing in the resource ID for the key vault. You can grant deployment access to users without granting write access to the secrets
  * reference the key vault in the parameter file, not the template for static
  * parent template, you add the nested template and pass in a parameter that contains the dynamically generated resource ID.
____

# Azure API Management
* Securing API acceses
  * Subscription keys
  * OAuth 2.0
  * Client certificates
  * Restricted caller IPs

*  Set-AzApiManagementApiRevision cmdlet and set the Path argument to $null to make revision __offline__

[virtual network](https://docs.microsoft.com/en-us/azure/api-management/api-management-using-with-vnet?tabs=stv2)

____

# Azure Policy
* Evaluation 
  * A resource is created, updated, or deleted in a scope with a policy assignment.
  * A policy or initiative is newly assigned to a scope.
  * A policy or initiative already assigned to a scope is updated.
  * During the standard compliance evaluation cycle, which occurs once every 24 hours.

* Policy Effects
  * Append
  * Audit
  * AuditIfNotExists
  * Deny
  * DeployIfNotExists
  * Disabled
  * Modify

* Initiatives is collection of policy definitions
* Resource manager modes
  * __all__: evaluate resource groups, subscriptions, and all resource types
  * __indexed__: only evaluate resource types that support tags and location

* Ways to determine Resource properties during Policy definition
  * Azure Policy extension for VS Code
  * Azure Resource Manager templates (ARM templates)
    * Export existing resource
    * Creation experience
    * Quickstart templates (GitHub)
    * Template reference docs
  * Azure Resource Explorer
* Ways to find out aliases
  * Azure Policy extension for VS Code
  * Azure CLI
  ```cmd
  az provider show --namespace Microsoft.Storage --expand "resourceTypes/aliases" --query "resourceTypes[].aliases[].name"
  ```
  * Azure PowerShell
  ```powershell
  (Get-AzPolicyAlias -NamespaceMatch 'Microsoft.Storage').Aliases
  ```
* When Azure Policy runs the template in the deployIfNotExists policy definition, it does so using a managed identity.
____

# Azure Blueprint
* Blueprint
  * Resource Groups
  * ARM templates
  * Policy assignments
  * Role assignments

____

# External Identities
* You can also use API connectors to integrate your self-service sign-up user flows with external cloud systems. You can connect with custom approval workflows, perform identity verification, validate user-provided information, and more.

# SQL Analytics
* Azure SQL Analytics is a cloud solution that monitors the performance of single databases, elastic pools and pooled databases, and managed instances and instance databases at scale and across multiple subscriptions. It can help you collect and visualize performance metrics, and it has built-in intelligence for performance troubleshooting.

___

# Azure Service Fabric
* Application Package -- * (Service package)
* Cluster -> * (nodes)
* Node
  * VM (FabricHost.exe, Fabric.exe , FabricGateway)

____

# Stretch Database
[overview](https://docs.microsoft.com/en-us/sql/sql-server/stretch-database/stretch-database?view=sql-server-ver15)
* Stretch Database migrates your cold data transparently and securely to the Microsoft Azure cloud.
* Provides cost-effective availability for cold data
* Doesn't require changes to queries or applications
* Streamlines on-premises data maintenance
* Keeps your data secure even during migration
[limitatins](https://docs.microsoft.com/en-us/sql/sql-server/stretch-database/limitations-for-stretch-database?view=sql-server-ver15)

# SQL Temporal tables
[overview](https://docs.microsoft.com/en-us/sql/relational-databases/tables/temporal-tables?view=sql-server-ver15)
* A system-versioned temporal table is a type of user table designed to keep a full history of data changes to allow easy point in time analysis

____

# Managed Disks
[overview](https://docs.microsoft.com/en-us/azure/virtual-machines/managed-disks-overview)

* Disk roles
  * OS Disk
  * Data Disk
  * Temporary disk

* Encryption
  * SSE(Server Side Encryption)
    * Microsoft managed keys
    * Customer managed keys
      * All resources related to your customer-managed keys (Azure Key Vaults, disk encryption sets, VMs, disks, and snapshots) must be in the same subscription and region.
      [restrictions](https://docs.microsoft.com/en-us/azure/virtual-machines/disk-encryption#restrictions)
    * Double encryption at REST

  * Azure disk encryption (OS and data disks for VM)
    * Azure Disk Encryption allows you to encrypt managed disks that are attached to IaaS virtual machines at rest and in transit. Azure Key Vault stores your keys. For Windows, the drives are encrypted by using industry-standard BitLocker encryption technology. For Linux, the disks are encrypted by using the dm-crypt subsystem. The encryption process is integrated with Azure Key Vault to allow you to control and manage the disk encryption keys
  
[caching](https://docs.microsoft.com/en-us/azure/virtual-machines/managed-disks-overview#disk-allocation-and-performance)
____

# Geography

Azure regions are organized into groups called geographies. An Azure geography ensures that data residency, sovereignty, compliance, and resiliency requirements are honored within geographical and political boundaries. If your workloads are subject to data sovereignty or other compliance requirements, deploy your storage resources to regions that are in a compliant Azure geography

___

# Azure Databox Gateway
* Azure Data Box Gateway is a storage solution that enables you to seamlessly send data to Azure
* Data Box Gateway is a virtual device based on a virtual machine provisioned in your virtualized environment or hypervisor. The virtual device resides in your premises and you write data to it using the NFS and SMB protocols. The device then transfers your data to Azure block blob, page blob, or Azure Files.
[overview](https://docs.microsoft.com/en-us/azure/databox-gateway/data-box-gateway-overview)

___

# Azure Storage
[encryption key management](https://docs.microsoft.com/en-us/azure/storage/common/storage-service-encryption#about-encryption-key-management)

[doble encryption](https://docs.microsoft.com/en-us/azure/storage/common/infrastructure-encryption-enable?tabs=portal)

* Archive data is not supported for file share.It works only with blob data.

[Immutable storage](https://docs.microsoft.com/en-us/azure/storage/blobs/immutable-storage-overview)
* Time based
* Legal based

[Advanced threat stroage protection](https://azure.microsoft.com/en-us/updates/advanced-threat-protection-for-azure-storage-now-generally-available/)
[Advaned threat storage protection availability](https://docs.microsoft.com/en-us/azure/storage/common/azure-defender-storage-configure?tabs=azure-security-center#availability)

* Public Access
  * If storage is not allowed then no containers and no blobs
  * If storgage is allowed 
    * Container is not allowed then no container
    * Container is allowed then both container and blob
    * Blob is allowed then only blob but not container
  * [access](https://docs.microsoft.com/en-us/azure/storage/blobs/anonymous-read-access-configure?tabs=portal#about-anonymous-public-read-access)

* immutability policies
  * [overview](https://docs.microsoft.com/en-us/azure/storage/blobs/immutable-policy-configure-version-scope?tabs=azure-portal)
  * WORM (Write Once Read More)
  * data cannot be modified or deleted for a user-specified interval
  * Applies to time-based retention policies and legal holds
  * Either blob or on Container
  * Blob Versioning must be enabled

* SAS
  * User delegation access
    * Azure AD credentials.
    * On blob only
    * Recommended for security reasons
  * Service SAS
    * Account Key
    * Only on one service Blob/Queue/Table/Azure Files
  * Account SAS
    * Account key.
    * one or more services  
* SAS forms
  * ad hoc
  * stored access policy
    * only for service SAS

* Azure Files and Blob storage -> customer managed keys
____

# Azure Data Transfer

[data transfer](https://docs.microsoft.com/en-us/azure/storage/common/storage-choose-data-transfer-solution)

* Offline
  * Data Box disk
  * Data Box 
  * Data Box Heavy
  * Import/Export(own disks)

* Network
  * Portal
  * Scripted/Programming
    * REST, AzCopy
  * On Premises device
    * Stack Edge
    * Data Box Gateway
  * Managed Pipeline
    * Data Factory
___

# AppInsights
[smart detection](https://docs.microsoft.com/en-us/azure/azure-monitor/app/proactive-diagnostics)

___

# Azure Encryption at Rest 

* DEK ( Data Encryption Key)
* KEK ( Key Encryption Key)

* Transparent data encryption (TDE) helps protect Azure SQL Database, Azure SQL Managed Instance, and Azure Synapse Analytics against the threat of malicious offline activity by encrypting **data at rest**
  * Encrypt=True and TrustServerCertificate=False

* DEK is protected by the TDE protector. TDE protector is either a service-managed certificate (service-managed transparent data encryption) or an asymmetric key stored in Azure Key Vault (customer-managed transparent data encryption).

* When you export a TDE-protected database, the exported content of the database isn't encrypted. This exported content is stored in unencrypted BACPAC files. Be sure to protect the BACPAC files appropriately and enable TDE after import of the new database is finished.

* [requirement for customer managed TDE](https://docs.microsoft.com/en-us/azure/azure-sql/database/transparent-data-encryption-byok-overview#requirements-for-configuring-customer-managed-tde)

* In an Azure SQL Database, the TDE protector is configured at the server level. All databases in the server inherit the same encryption key.
[TDE customer managed](https://www.sqlshack.com/tde-customer-managed-keys-in-azure-sql-database/)

[sql database security](https://docs.microsoft.com/en-us/azure/azure-sql/database/security-overview)
____

# SQL Always encrypted
[overview](https://docs.microsoft.com/en-us/sql/relational-databases/security/encryption/always-encrypted-database-engine?view=sql-server-ver15)
* Always Encrypted is a feature designed to protect sensitive data, such as credit card numbers or national identification numbers (for example, U.S. social security numbers), stored in Azure SQL Database or SQL Server databases
 * Deterministic
 * Randomized
[details](https://www.mssqltips.com/sqlservertip/4011/sql-server-2016-always-encrypted/)

____

# Disaster recovery
## VM 
* [vm](https://docs.microsoft.com/en-us/azure/site-recovery/azure-to-azure-architecture#feedback)
* [replication](https://docs.microsoft.com/en-us/azure/site-recovery/azure-to-azure-architecture#replication-process)
  * Site Recovery Mobility service extension installed
  * Extension registers with Site Recovery

[Application and Crash consistencies](https://www.youtube.com/watch?v=VgJASTjIRgY)

* On premises failover options
  * Test failover
  * Planned failver for Hyper-V
  * Failover Hyper-V
  * Failver VMWare

* Site Recovery Deployment Planner is a command-line tool for both Hyper-V to Azure and VMware to Azure disaster recovery scenarios. You can remotely profile your VMware VMs by using this tool (with no production impact whatsoever) to understand the bandwidth and storage requirements for successful replication and test failover. You can run the tool without installing any Site Recovery components on-premises. To get accurate achieved throughput results, run the planner on a Windows Server that meets the minimum requirements of the Site Recovery configuration server that you eventually need to deploy as one of the first steps in production deployment.
____

## SQL Database
[dr](https://docs.microsoft.com/en-us/azure/azure-sql/database/designing-cloud-solutions-for-disaster-recovery)

* Notes
  * For disaster recovery, we recommend the configuration with application deployment limited to two regions. This is because most of the Azure geographies have only two regions. This configuration does not protect your application from a simultaneous catastrophic failure of both regions. In an unlikely event of such a failure, you can recover your databases in a third region using geo-restore operation.
  * Strategy
    * [Minimum downtime](https://docs.microsoft.com/en-us/azure/azure-sql/database/designing-cloud-solutions-for-disaster-recovery#scenario-1-using-two-azure-regions-for-business-continuity-with-minimal-downtime)

    * [Maximum data preservation](https://docs.microsoft.com/en-us/azure/azure-sql/database/designing-cloud-solutions-for-disaster-recovery#scenario-2-azure-regions-for-business-continuity-with-maximum-data-preservation)

    * [witout data loss and near zero downtime](https://docs.microsoft.com/en-us/azure/azure-sql/database/designing-cloud-solutions-for-disaster-recovery#scenario-1-using-two-azure-regions-for-business-continuity-with-minimal-downtime)

* Active Geo replication
  * [active geo replication](https://docs.microsoft.com/en-us/azure/azure-sql/database/active-geo-replication-overview)
  * Can be used for DR
  * Database migration
  * Application Upgrades.

* SQL Database and SQL Managed Instance also provide several business continuity features that you can use to mitigate various unplanned scenarios.

  * __Temporal tables__ enable you to restore row versions from any point in time.
  * __Built-in automated backups__ and __Point in Time Restore__ enables you to restore complete database to some point in time within the configured retention period up to 35 days.
  * You can __restore a deleted database__ to the point at which it was deleted if the server has not been deleted.
  * __Long-term backup retention__ enables you to keep the backups up to 10 years. This is in limited public preview for SQL Managed Instance.
  * __Active geo-replication__ enables you to create readable replicas and manually failover to any replica in case of a datacenter outage or application upgrade.
  * __Auto-failover group__ allows the application to automatically recover in case of a datacenter outage.

  [auto failover vs geo replication](https://docs.microsoft.com/en-us/azure/azure-sql/database/business-continuity-high-availability-disaster-recover-hadr-overview#compare-geo-replication-with-failover-groups)

____

# Azure accelerated network

[overview](https://docs.microsoft.com/en-us/azure/virtual-network/create-vm-accelerated-networking-powershell)

* When communicating across virtual networks or connecting on-premises, this feature has minimal impact to overall latency
* Policies are enforced at host (without accelerated policies are enforced at Virtual switch)
* A supported VM size without accelerated networking enabled can only have the feature enabled when it's stopped and deallocated.

____

# Migraiton
* DMA
  * [DMA](https://docs.microsoft.com/en-us/sql/dma/dma-overview?view=sql-server-2017)
  * DMA does not support database migrations to Azure SQL Managed Instance. Recommendation is to use the Azure SQL Migration extension for Azure Data Studio, which supports both online and offline database migrations to Azure SQL Managed Instance
  * Assess on-premises SQL Server instance(s) migrating to Azure SQL database(s)
  * Discover issues that can affect an upgrade to an on-premises SQL Server
  * Discover new features in the target SQL Server platform that the database can benefit from after an upgrade
  * Migrate an on-premises SQL Server instance to a modern SQL Server instance hosted on-premises or on an Azure virtual machine (VM) that is accessible from your on-premises network
  * Assess on-premises SQL Server Integration Services (SSIS) package(s) migrating to Azure SQL Database or Azure SQL Managed Instance

  ____

  # Azure AD Applications
  [overview](https://docs.microsoft.com/en-us/azure/active-directory/manage-apps/what-is-application-management)

  * Pre-integrated applications
    * ex: Office 365, Box, DocuSign
  * Your own applications
  * On-premises applications
    * take advantage of what Azure AD offers, connect it with Azure AD using Azure __AD Application Proxy__. Application Proxy can be implemented when you want to publish on-premises applications externally. Remote users who need access to internal applications can then access them in a secure manner.
    * Application Proxy is a feature of Azure AD that enables users to access on-premises web applications from a remote client. Application Proxy includes both the Application Proxy service which runs in the cloud, and the Application Proxy connector which runs on an on-premises server. Azure AD, the Application Proxy service, and the Application Proxy connector work together to securely pass the user sign-on token from Azure AD to the web application

_____

# Hybrid environments
* AD DS in Azure
  * [ad ds architecture](https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/identity/adds-extend-domain)
  * If your application is hosted partly on-premises and partly in Azure, it may be more efficient to replicate Active Directory Domain Services (AD DS) in Azure. This can reduce the latency caused by sending authentication requests from the cloud back to AD DS running on-premises.

  * This architecture is commonly used when the on-premises network and the Azure virtual network are connected by a VPN or ExpressRoute connection. This architecture also supports bidirectional replication, meaning changes can be made either on-premises or in the cloud, and both sources will be kept consistent. Typical uses for this architecture include hybrid applications in which functionality is distributed between on-premises and Azure, and applications and services that perform authentication using Active Directory.

* Supported bandwidths for Express routes: 50 Mbps, 100 Mbps, 200 Mbps, 500 Mbps, 1 Gbps, 2 Gbps, 5 Gbps, 10 Gbps

[Local preferences](https://docs.microsoft.com/en-us/azure/expressroute/expressroute-optimize-routing#suboptimal-routing-from-customer-to-microsoft)

[BGP communities from On premises to Azure](https://docs.microsoft.com/en-us/azure/expressroute/expressroute-optimize-routing#solution-use-bgp-communities)
[use AS PATH prepending from Azure](https://docs.microsoft.com/en-us/azure/expressroute/expressroute-optimize-routing#solution-use-as-path-prepending)
[vnet to vnet] (https://docs.microsoft.com/en-us/azure/expressroute/expressroute-optimize-routing#solution-assign-a-high-weight-to-local-connection)

* Forced tunnelling for Site to Site
  * [forced tunnel for vpn](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-forced-tunneling-rm)
  * Forced tunneling lets you redirect or "force" all Internet-bound traffic back to your on-premises location via a Site-to-Site VPN tunnel for inspection and auditing. This is a critical security requirement for most enterprise IT policies. If you don't configure forced tunneling, Internet-bound traffic from your VMs in Azure always traverses from the Azure network infrastructure directly out to the Internet, without the option to allow you to inspect or audit the traffic. Unauthorized Internet access can potentially lead to information disclosure or other types of security breaches
____

# Azure Files
[overview](https://docs.microsoft.com/en-us/azure/storage/files/storage-files-introduction)

* SMB and NFS
* SMB - windows, linux, mac
* NFS - linux, mac
* SMB - cached on windows server with Azure file sync

* The SMB protocol requires TCP port **445** to be open
[useful](https://docs.microsoft.com/en-us/azure/storage/files/storage-files-introduction#why-azure-files-is-useful)

* Azure file shares leverages Kerberos protocol for authenticating with either on-premises AD DS or Azure AD DS. When an identity associated with a user or application running on a client attempts to access data in Azure file shares, the request is sent to the domain service, either AD DS or Azure AD DS, to authenticate the identity. If authentication is successful, it returns a Kerberos token. The client sends a request that includes the Kerberos token and Azure file shares use that token to authorize the request. Azure file shares only receive the Kerberos token, not access credentials

[Azure files security](https://docs.microsoft.com/en-us/azure/storage/files/storage-files-identity-auth-active-directory-domain-service-enable?tabs=azure-portal)

____

# Azure Container Instances
* Azure Container Instances offers the fastest and simplest way to run a container in Azure, without having to manage any virtual machines and without having to adopt a higher-level service.

* Azure Container Instances is a great solution for any scenario that can operate in isolated containers, including simple applications, task automation, and build jobs. For scenarios where you need full container orchestration, including service discovery across multiple containers, automatic scaling, and coordinated application upgrades, we recommend Azure Kubernetes Service (AKS).

* A container group is a collection of containers that get scheduled on the same host machine. The containers in a container group share a lifecycle, resources, local network, and storage volumes. It's similar in concept to a pod in Kubernetes

* Multi-container groups currently support only Linux containers. For Windows containers, Azure Container Instances only supports deployment of a single container instance. While we are working to bring all features to Windows containers

* Storage
  * Azure file share
  * Secret
  * Empty directory
  * Cloned git repo

____

# AKS
* Ingress controller
  * [overview](https://docs.microsoft.com/en-us/azure/aks/ingress-basic)
  * An ingress controller is a piece of software that provides reverse proxy, configurable traffic routing, and TLS termination for Kubernetes services. Kubernetes ingress resources are used to configure the ingress rules and routes for individual Kubernetes services. Using an ingress controller and ingress rules, a single IP address can be used to route traffic to multiple services in a Kubernetes cluster

____
# Azure Automation

* Process Automation
* Configuration Management
  * Change tracking and inventory
  * Azure Automation State Configuration
* Update Management

[common scenarios](https://docs.microsoft.com/en-us/azure/automation/overview#common-scenarios)
____

# Azure Lighthouse
* Enables multi-tenant management with scalability, higher automation, and enhanced governance across resources

___

# Backup
* SQL VM
  * Automated Backup automatically configures Managed Backup to Microsoft Azure for all existing and new databases on an Azure VM running SQL Server 2014 Standard or Enterprise. This enables you to configure regular database backups that utilize durable Azure Blob storage. Automated Backup depends on the SQL Server infrastructure as a service (IaaS) Agent Extension

* Offline backup
  * [overview](https://docs.microsoft.com/en-us/azure/backup/offline-backup-overview)
  * Using Data Box 
  * Using Azure Export/Import services
___ 
# Azure Firewall
* Azure Firewall Premium provides advanced threat protection that meets the needs of highly sensitive and regulated environments, such as the payment and healthcare industries.

____

# Azure HPC
* Batch
* CycleCloud
____

# Azure DNS
* Virtual networks DNS resolution methods
  * [overview] (https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-name-resolution-for-vms-and-role-instances#azure-provided-name-resolution)
  * DNS Private Zones
  * Azure provided name resolution
  * Own DNS server
____

# On premises Gateway
[overview](https://docs.microsoft.com/en-us/data-integration/gateway/service-gateway-onprem)
[how it works](https://docs.microsoft.com/en-us/azure/logic-apps/logic-apps-gateway-install#how-the-gateway-works)

____

# General
[ssis](https://www.youtube.com/watch?v=I_Ae3suaL-U)
* BI
  * Collect
    * SSIS
        * Extract, Transform, Load
  * Analyze
  * View

____

# Practice samples
[edusum](https://www.edusum.com/microsoft/microsoft-azure-architect-design-az-304-certification-sample-questions)
