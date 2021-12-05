# Monitoring
# Cost Management

# SQL Database

* Use point-in-time restore to recover from human error by returning the database to an earlier point in time.
* Use geo-restore to recover from a service outage by restoring a database from a geo-redundant backup.

[Query performance insights](https://docs.microsoft.com/en-us/azure/azure-sql/database/query-performance-insight-use)

# App Service
Avoid using the App Service backup feature to back up your SQL databases because it exports the database to a SQL BACPAC file, consuming DTUs. Instead, use SQL Database point-in-time restore

# **B**usiness **C**ontinutity **D**isastor **R**ecovery
## SQL Database
* To protect your business from data loss, SQL Database and SQL Managed Instance automatically create full database backups weekly, differential database backups every 12 hours, and transaction log backups every 5 - 10 minutes. The backups are stored in RA-GRS storage for at least seven days for all service tiers. All service tiers except Basic support configurable backup retention period for point-in-time restore, up to 35 days

[Automatic Tuning](https://docs.microsoft.com/en-us/azure/azure-sql/database/automatic-tuning-overview)
# Azure Active Directory
## SSPR
* [Recommendations](https://docs.microsoft.com/en-us/learn/modules/allow-users-reset-their-password/2-self-service-password-reset)
# Resources
[304 certification](https://charbelnemnom.com/passed-az-304-exam-microsoft-azure-architect-design/)

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

# Azure Cost
* [Spending limit](https://docs.microsoft.com/en-us/azure/cost-management-billing/manage/spending-limit)
  * For Free account
  * Not applicable for Commit Plans or Pay as You GO
