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
