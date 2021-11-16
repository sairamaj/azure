# VMs
[Azure VM SLA](https://azure.microsoft.com/en-us/support/legal/sla/virtual-machines/v1_9/)
Charged hourly. Partial hours for minutes. Storage is separate.

* To update OS Disk , VM has to be in stopped state.
* To upgrade data disk(ex: from Standard SDD to Premimum HDD) VM has to be stopped.

* Spot VMs
  * If the max price is set to -1	The VM will not be evicted for pricing reasons. The max price will be the current price, up to the price for standard VMs. You will never be charged above the standard price.
  * change the max price for a spot VM
    * you need to deallocate the VM. Then you can change the max price
* Disk encryption
  * dm-crypt subsystem in Linux to provide full disk encryption 
  * leverages BitLocker to provide full disk encryption on Azure virtual machines running Windows
  * -VolumeType-All
    * If you specify volumetype-all when enabling encryption, this is applicable to all all new disks
    * Works for both managed and unmanaged.
* Network watcher
  * Azure Network Watcher is a network performance monitoring, diagnostic, and analytics service that allows monitoring of Azure networks. The Network Watcher Agent virtual machine extension is a requirement for capturing network traffic on demand, and other advanced functionality on Azure virtual machines.
* Restricting agent installation
  * If you want to prevent the use or installation of certain extensions on your Windows VMs, you can create an Azure Policy definition using PowerShell to restrict extensions for VMs within a resource group
[Images vs Snapshots](https://docs.microsoft.com/en-us/azure/virtual-machines/managed-disks-overview#images-versus-snapshots)
* Disk Types
  * Ultra
  * Premimum SDD
  * Standard SDD
  * Standard HDD
  [Comparision](https://docs.microsoft.com/en-us/azure/virtual-machines/disks-types#disk-type-comparison)

* Shared Disks
  * Azure shared disks is a feature for Azure managed disks that allow you to attach a managed disk to multiple virtual machines (VMs) simultaneously. Attaching a managed disk to multiple VMs allows you to either deploy new or migrate existing clustered applications to Azure

* Throughput are guaranteed when a premium storage disk and also to Ultra disks.

* Encryption
 * Azure Disk Encryption(ADE)
 * Server side encryption
   * Platform managed.
   * Customer managed.
 * Encryption at host (VM data is encrypted at host and flows to server side and no server side encryption is done)
 * [encryption comparision](https://docs.microsoft.com/en-us/azure/virtual-machines/disk-encryption-overview#comparison)
* Virtual network NAT
  * [Outbound connectivity is possible without load balancer or public IP addresses directly attached to virtual machines](https://docs.microsoft.com/en-us/azure/virtual-network/network-overview?context=/azure/virtual-machines/context/context#virtual-network-nat)

* Azure IAAS need access to the encryption keys in your key vault to make them available to the VM for encrypting and decrypting the volumes.
* Set-AzureRmVMDiskEncryptionExtension - Enables encryption on a running IaaS virtual machine in Azure.

* Hyper-V VMs migration 
  * Disk size
    * 2TB for Gen-1, 300GB for Gen-2
    * Data Disk VHD size: 4TB
* VMWare
  * Disk size
    * up to 2 TB OS disk for gen 1 VM and gen 2 VMs; 32 TB for data disks
  
* The performance diagnostics tool helps you troubleshoot performance issues that can affect a Windows or Linux virtual machine (VM). Supported troubleshooting scenarios include quick checks on known issues and best practices, and complex problems that involve slow VM performance or high usage of CPU, disk space, or memory

* Using managed disks, you can create up to 50,000 VM disks of a type in a subscription per region, allowing you to create thousands of VMs in a single subscription. This feature also further increases the scalability of virtual machine scale sets by allowing you to create up to 1,000 VMs in a virtual machine scale set using a Marketplace image.

* Virtual machine needs to be located in the same region as Virtual network.
* Azure machine and key vault should be in the same region for disk encryption. Both windows and linux machines can do disk encryption.

* Bastion 
  * Name of the subnet is AzureBasionSubnet
  * Address is at least /26
    * /26 is valid
    * /25 is valid (bigger)
    * /27 is invalid (smaller)
___

 # Monitoring
 * **SMS**: No more than 1 SMS every 5 minutes.
 * **Voice**: No more than 1 Voice call every 5 minutes.
 * **Email**: No more than 100 emails in an hour
 [rate limits](https://docs.microsoft.com/en-us/azure/azure-monitor/alerts/alerts-rate-limiting)

___

 # Load Balancer
 A public load balancer can provide outbound connections for virtual machines (VMs) inside your virtual network. These connections are accomplished by translating their private IP addresses to public IP addresses. Public Load Balancers are used to load balance internet traffic to your VM.

 * Standard is recommended for production workloads.
 * Basic load balancer doesn't support zones.
 * A **zone redundant** Load Balancer can serve a zonal resource in any zone with one IP address. The IP can survive one or more zone failures as long as at least one zone remains healthy within the region.
* A **zonal frontend** is a reduction of the service to a single zone and shares fate with the respective zone. If the zone your deployment is in goes down, your deployment will not survive this failure

* The outbound rules tab is only valid for a public standard load balancer. Outbound rules are not supported on an internal or basic load balancer. Azure Virtual Network NAT is the recommended way to provide outbound internet access for the backend pool.

___

# Service Bus
Compatible with
* ActiveMQ
* RabbitMQ
* Java/Jakarta
* JMS 1.1

* Topic Subscriptions are durable by default, but can be configured to expire and then be automatically deleted.

* Topics/subscriptions aren't supported in the Basic pricing tier
* Expiration
  * At that time, the expires-at-utc property takes on the value enqueued-time-utc + time-to-live. The time-to-live (TTL) setting on a brokered message isn't enforced when there are no clients actively listening
* Message time to live
  * Message time to live determines how long a message will stay in the queue before it expires and is removed or dead lettered. When sending messages it is possible to specify a different time to live for only that message. This default will be used for all messages in the queue which do not specify a time to live for themselve
* Lock duration
  * Sets the amount of time that a message is locked for other receivers. After its lock expires, a message pulled by one receiver becomes available to be pulled by other receivers. Defaults to 30 seconds, with a maximum of 5 minutes.
* Delete the queue immediately after it remains idle for a configurable amount of time
* Enable duplicate detection
  * Enabling duplicate detection configures your queue to keep a history of all messages sent to the queue for a configurable amount of time. During that interval, your queue will not accept any duplicate messages. Enabling this property guarantees exactly-once delivery over a user-defined span of time
* Dead letter queue
  * Dead lettering messages involves holding messages that cannot be successfully delivered to any receiver to a separate queue after they have expired. Messages do not expire in the dead letter queue, and it supports peek-lock delivery and all transactional operations. 
* Enable session
  * Service bus sessions allow ordered handling of unbounded sequences of related messages. With sessions enabled a queue can guarantee first-in-first-out delivery of messages.
* Forward message
  * Automatically forward messages to a queue or topic in the same namespace

* To realize a FIFO guarantee in Service Bus, use sessions
* When sessions are enabled on a queue or a subscription, the client applications can no longer send/receive regular messages. All messages must be sent as part of a session (by setting the session id) and received by accepting the session.

* Maximum delivery count
  * The default value is 10. Whenever a message has been delivered under a peek-lock, but has been either explicitly abandoned or the lock has expired, the delivery count on the message is incremented. When the delivery count exceeds the limit, the message is moved to the DLQ.

___

# Computer Vision API
* Analyze Image
* OCR - Optical Character Recognition
* Image Recognition
  * Celebrities
  * Landmarks
* Hand written text
[you tube](https://www.youtube.com/watch?v=zMfN3SJoBFI&ab_channel=PragmaticWorks)

# App service
* Shared (dev/test)
  * Free and Shared
  * F1
    * No custom domain
    * 60 min/day compute
  * D1
    * custom domain
  * B1
    * Custom domain
    * manual scale
* Dedicated Computer
  * P1V2,P1V3,PxVy
  * S1,S2,S2
  * P1,P2,P3
* Isolated
  * I1V2,I2V2,I3V2

* F1 & D1 don't suport client TLS

* The Standard service plan is designed for running production workloads. Pricing is based on the size and number of instances you run. Built-in network load-balancing support automatically distributes traffic across instances. The Standard plan includes auto-scale which can automatically adjust the number of virtual machine instances running to match your traffic needs. The Standard service plan with Linux runtime environments supports Web App for Containers.
* Shared plan does not support auto scaling.

[diagnostic logging] https://docs.microsoft.com/en-us/azure/app-service/troubleshoot-diagnostic-logs
[configure logging](https://docs.microsoft.com/en-us/learn/modules/capture-application-logs-app-service/2-enable-and-configure-app-service-application-logging)
___

### WebJobs
Schedule uses [Ncrontab](https://github.com/atifaziz/NCrontab)
* {second} {minute} {hour} {day} {month} {day-of-week}

___

# Azure Backup
A Recovery Services vault is a logical container that stores the backup data for each protected resource, such as Azure VMs. When the backup job for a protected resource runs, it creates a recovery point inside the Recovery Services vault. You can then use one of these recovery points to restore data to a given point in time.

* You can only select VMs in the same region as the vault.
* VMs can only be backed up in a single vault

* **M**icrosoft **A**zure **R**ecovery **S**ervices agent
  * Runs on individual on-premises Windows Server machines to back up files, folders, and the system state.
  * Runs on Azure VMs to back up files, folders, and the system state.
  * Runs on DPM/MABS servers to back up the DPM/MABS local storage disk to Azure.
* Azure VM extension
  * Runs on Azure VMs to back them up to a vault.

To create a vault to protect any data source, the vault must be in the same region as the data source.

* On premises server with  Windows Admin Center
  * Register windows admin server with and configure azure backup
  * Windows server backup cannot be used with azure backup
___
# Azure AD
## Device Management
Get device identity
* Azure AD registration
* Azure AD Join
  * Windows 10
  * Windows Server 2019
* Hybrid Azure AD Join
  * Windows 7 and Server 2008 onwards

## Conditional policy
* Requiring multi-factor authentication for users with administrative roles
* Requiring multi-factor authentication for Azure management tasks
* Blocking sign-ins for users attempting to use legacy authentication protocols
* Requiring trusted locations for Azure AD Multi-Factor Authentication registration
* Blocking or granting access from specific locations
* Blocking risky sign-in behaviors
* Requiring organization-managed devices for specific applications

* Administrative Units
  * Azure AD resource that can be a container for other Azure AD resources. An administrative unit can contain only users and groups.

* PIM
  * P2 
  * Global administrator, Privileged Global administrator.
  * Eligible/Active
  
___

# Resource Locks

* **CanNotDelete** means authorized users can still read and modify a resource, but they can't delete the resource.
* **ReadOnly** means authorized users can read a resource, but they can't delete or update the resource. Applying this lock is similar to restricting all authorized users to the permissions granted by the Reader role

* A read-only lock on a resource group that contains a virtual machine prevents all users from starting or restarting the virtual machine. These operations require a **POST request**
* A read-only lock on a storage account doesn't prevent data within that account from being deleted or modified. This type of lock only protects the storage account itself from being deleted or modified, and doesn't protect blob, queue, table, or file data within that storage account

[lock resource](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/lock-resources?tabs=json)

When you apply a lock at a parent scope, all resources within that scope inherit the same lock. Even resources you add later inherit the lock from the parent. The most restrictive lock in the inheritance takes precedence

____

# SQL
* Column Encryption
  * [Column Encryption](https://docs.microsoft.com/en-us/azure/azure-sql/database/always-encrypted-azure-key-vault-configure?tabs=azure-powershell#encrypt-columns-configure-always-encrypted)
  * Always Encrypted
  * Master Key configuraiton
* Failover
  * The secondary cannot be in the same region as the primary for fail over.
  * For two managed instances to participate in a failover group, there must be either ExpressRoute or a VPN gateway configured between the virtual networks of the two managed instances to allow network communication.
  * Global VNet Peering is not supported.
  * Primary and secondary should be in the same resource group.

*  Use a system-assigned identity for a Windows virtual machine (VM) to access Azure SQL Database. Managed Service Identities are automatically managed by Azure and enable you to authenticate to services that support Azure AD authentication, without needing to insert credentials into your code.
  * Create a contained user in the database that represents the VM's system assigned identity
  * Get an access token using the VM identity and use it to query Azure SQL Database

* Microsoft SQL Server Always On availability group on Azure virtual machines.You need to configure an Azure internal load balancer as a listener for the availability group. Backend port should use Floating IP

* The elastic query feature (in preview) enables you to run a Transact-SQL query that spans multiple databases in Azure SQL Database

* Azure SQL Database elastic pools are a simple, cost-effective solution for managing and scaling multiple databases that have varying and unpredictable usage demands. The databases in an elastic pool are on a single server and share a set number of resources at a set price.

* Always Encrypted with **secure enclaves** expands confidential computing capabilities of Always Encrypted by enabling in-place encryption and richer confidential queries. Always Encrypted with secure enclaves is available in SQL Server 2019 (15.x) and in Azure SQL Database

* Always on availability is the high availability mechansim for SQL servers running on Azure virtual machines.

* Transactions
  * Elastic database transactions for Azure SQL Database (Preview) and Azure SQL Managed Instance allow you to run transactions that span several databases.
  * On premises, such a scenario usually requires running Microsoft Distributed Transaction Coordinator (MSDTC). Since MSDTC isn't available for Platform-as-a-Service application in Azure, the ability to coordinate distributed transactions has now been directly integrated into SQL Database or SQL Managed Instance.
  * A server-side experience (code written in stored procedures or server-side scripts) using Transact-SQL is available for SQL Managed Instance only.
  * Running elastic database transactions between Azure SQL Database and Azure SQL Managed Instance is not supported. Elastic database transaction can only span across a set of databases in SQL Database or a set databases across managed instances
_____

# Hybrid Identity
Azure AD Connect installs an on-premises service which orchestrates synchronization between Active Directory and Azure Active Directory
* sAMAccountName attribute must be included in the attribute inclusion list to export a user object to Active Directory because all user objects in Active Directory must have a sAMAccountName attribute defined


* In Express settings, the installation wizard asks for the following:
  * AD DS Enterprise Administrator credentials
    * The AD DS Enterprise Admin account is used to configure your on-premises Active Directory. These credentials are only used during the installation and are not used after the installation has completed
  * Azure AD Global Administrator credentials
    * These credentials are only used during the installation and are not used after the installation has completed.

[Comparision Azure AD Connect vs Cloud Sync](https://docs.microsoft.com/en-us/azure/active-directory/cloud-sync/what-is-cloud-sync?toc=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Fazure%2Factive-directory%2Fcloud-sync%2Ftoc.json&bc=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Fazure%2Fbread%2Ftoc.json)
* No pass through for Cloud Sync.

[add connect](https://www.youtube.com/hashtag/aadconnect)

[two ways to select the domains to be synchronized: - Using the Synchronization Service - Using the Azure AD Connect wizard](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-sync-configure-filtering#select-the-domains-to-be-synchronized)

The Synchronization Rules Editor is used to see and **change the default configuration** (If question is to stop existing sync, then it is rule editor.)

Azure AD Connect Health for monitor and should have AD Premium 1 license

* AD Connect Staging mode
  * scenarios
    * High availability
    * Test and deploy new configuration changes
    * Introduces new server and decommisions old one.
  * During installation, you can select the server to be in staging mode. This action makes the server active for import and synchronization, but it does not run any exports. A server in staging mode is not running password sync or password writeback, even if you selected these features during installation. When you disable staging mode, the server starts exporting, enables password sync, and enables password writeback.

* To perform what domains are synchronized on to Azure AD, you can use either Synchronization Manager or the Azure AD connect wizard.
____


# QnA Maker
* Add customer question/answer content - QnA Maker management service
* Use Azure application insights resource for analysis - QnA Maker runtime
* Update and train a knowledge base - QnA Maker management service

____


# Blue Prints
* Role Assignments
* Policy Assignments
* Azure Resource Manager templates(ARM templates)
* Resource Groups

____

# Azure Kubernetes Service(AKS)

When you create an AKS cluster, Azure also creates a service principal to support cluster operability with other Azure resources. This service principal can already authenticate to AAD (since it was created in AAD).
But it needs to be RBAC permissions on the ACR Registry to pull images. To do so, you need to create an Azure AD role assignment that grants the cluster's service principal access to the container registry.

* To connect to cluster
  * az aks install-cli
  * az aks get-credentials --resource-group myResourceGroup --name myAKSCluster

[container monitor](https://docs.microsoft.com/en-us/azure/azure-monitor/containers/container-insights-onboard)
[monitor](https://docs.microsoft.com/en-us/azure/azure-monitor/containers/container-insights-analyze)
____

# General
* You are developing a speech-enabled home automation control bot.The bot interprets some spoken words incorrectly.You need to improve the spoken word recognition for the bot.
What should you implement?
* The web channel chat and Speech priming using Bing Speech and Service and LUIS app.

* You have an Azure subscription.You create an Azure web app named Contoso1812 that uses an S1 App service plan.You create a DNS record for www.contoso.com that points to the IP address of Contoso1812.You need to ensure that users can access ontoso1812 by using the https://www.contoso.com URL. Which two actions should you perform? Each correct answer presents part of the solution.
* Add host name to Contoso1812
* Upload PFX file to Contoso1812

# CosmoDB
Account -> Database -> Containers -> Items

* Microsoft recommends using the same API for all access to the data in a given account.
* One throughput provisioned container per subscription for SQL, Gremlin API, and Table accounts.
* Up to three throughput provisioned collections per subscription for MongoDB accounts.
* The throughput provisioned on an Azure Cosmos container is exclusively reserved for that container. The container receives the provisioned throughput all the time.

* Throughput
  * The throughput provisioned on an Azure Cosmos container is exclusively reserved for that container
  * most frequently used option
  * provision throughput on an Azure Cosmos database, the throughput is shared across all the containers (called shared database containers) in the database
  [doc](https://docs.microsoft.com/en-us/azure/cosmos-db/set-throughput#set-throughput-on-a-container)

* ID is generated it not specified
* Partition key can be missing the data.

* Throughput
  * RU
    * The cost to do a point read (i.e. fetching a single item by its ID and partition key value) for a 1 KB item is 1 Request Unit.
  * Provisioned
    * Manual scale
    * Auto scale
  * Server less
# Key Vault
* Access to a key vault is controlled through two interfaces: the management plane and the data plane. The management plane is where you manage Key Vault itself. Operations in this plane include creating and deleting key vaults, retrieving Key Vault properties, and updating access policies. The data plane is where you work with the data stored in a key vault. You can add, delete, and modify keys, secrets, and certificates. To access a key vault in either plane, all callers (users or applications) must have proper authentication and authorization. Authentication establishes the identity of the caller. Authorization determines which operations the caller can execute.
* Both planes use Azure Active Directory (Azure AD) for authentication. For authorization, the management plane uses role-based access control (RBAC) and the data plane uses a Key Vault access policy.

# Migration
* An Azure Migrate project is used to store discovery, assessment, and migration metadata collected from the environment you're assessing or migrating. In a project you can track discovered assets, create assessments, and orchestrate migrations to Azure.
* Deploy a lightweight Azure Migrate appliance. The appliance continuously discovers on-premises machines and sends machine metadata and performance data to Azure Migrate. Deploy the appliance as a VM or a physical machine. You don't need to install anything on machines that you want to assess.
* After the appliance begins machine discovery, you can gather machines you want to assess into a group and run an assessment for the group with assessment type Azure VM

# Azure container instance
* A container group is a collection of containers that get scheduled on the same host machine. The containers in a container group share a lifecycle, resources, local network, and storage volumes. It's similar in concept to a pod in Kubernetes.
[groups](https://docs.microsoft.com/en-us/azure/container-instances/container-instances-container-groups)

____

# Virtual Network
* Virtual Network (VNet) service endpoint provides secure and direct connectivity to Azure services over an optimized route over the Azure backbone network. Endpoints allow you to secure your critical Azure service resources to only your virtual networks. Service Endpoints enables private IP addresses in the VNet to reach the endpoint of an Azure service without needing a public IP address on the VNet.

_____

# Azure Files
Azure Files offers fully managed file shares in the cloud that are accessible via the industry standard Server Message Block (SMB) protocol or Network File System (NFS) protocol. Azure file shares can be mounted concurrently by cloud or on-premises deployments. Azure Files SMB file shares are accessible from Windows, Linux, and macOS clients. Azure Files NFS file shares are accessible from Linux or macOS clients. Additionally, Azure Files SMB file shares can be cached on Windows Servers with Azure File Sync for fast access near where the data is being used.

____

# Service Health

____

# Traffic Manager

[How to send Real User Measurements to Azure Traffic Manager using web pages](https://docs.microsoft.com/en-us/azure/traffic-manager/traffic-manager-create-rum-web-pages)
JavaScript code snippet that needs to be embedded into your HTML page.

____

# Logic App
The Consumption resource type runs in the multi-tenant Azure Logic Apps or integration service environment, while the Standard resource type runs in single-tenant Azure Logic Apps environment

____

# Azure Storage
[sku types](https://docs.microsoft.com/en-us/rest/api/storagerp/srp_sku_types)
* sku: name: redundency type Standard_LRS
* sku: tier: blob container performance type
* kind: storage account type (ex:    kind:Storage, BlobStorage, StorageV2 )

___

# Auto scale example
* Configuration
  * scale out >70 by 2
  * min=1, max=6, default=2
  * duration=20, cool down=10
* Scenario
  * 8:00 cpu : 50
  * 9:00 cpu:  75
* Question
  * How many instances at 9:35
  * as duration is 20 , the first scale will happen at : 9:20
  * instances will be 2+2 = 4
  * cool down to 10mins
  * reaches 9:30
  * as duration is 20mins
  * next evaluation happens at 9:50
  * at 9:50 if it is still 75 it would have gone by 2 more which is 6
  * question is at 9:35, how many instances? ans: 4

* In case of multiple auto scaling conditions , the most important to remember: for the **scale-out** process, only **one** condition to meet is enough, and for **scale-in**, you need to meet **all** of them.
____

# Azure Firewall manager
Azure Firewall Manager is a security management service that provides central security policy and route management for cloud-based security perimeters

_____

* Azure MFA can be enforced in multiple ways (Security Administrator,Conditional Access Administrator, Global Administrator)
  * Through conditional access policy
    * Signal
      * User and location
      * Application
      * Device
      * Real-time risk
    * Access
      * Block
      * Grant (with MFA)
  * Through security defaults
  * By instituting per-user MFA
  * Through Azure identity protection
    * Automate the detection and remediation of identity-based risks
    * Investigate risks using data in the portal.
    * Export risk detection to third party tools for further analysis.

* MFA can also be trigged by
  * Requring MFA for device registration on your tenant device settings
  * To complete self-service password reset.
  * Per request by the application,such as federation IDP like ADFS requring MFA be performed.
  [mfa-video](https://www.youtube.com/watch?v=qNndxl7gqVM&ab_channel=MicrosoftSecurity)

  # File Import/Export
  ## Azure files
  * WAImportExport.exe
  * dataset.csv
  * driveset.csv

  # General
  * Ensure port 445 is open: The SMB protocol requires TCP port 445 to be open; connections will fail if port 445 is blocked. You can check if your firewall is blocking port 445 with the Test-NetConnection cmdlet.

  # Azure resource move
  * Move-AzureRmResource

  # Migration
  * Before you upload a Windows virtual machine (VM) from on-premises to Azure, you must prepare the virtual hard disk (VHD or VHDX). Azure supports both generation 1 and generation 2 VMs that are in VHD file format and that have a fixed-size disk. The maximum size allowed for the OS VHD on a generation 1 VM is 2 TB.
* You can convert a VHDX file to VHD, convert a dynamically expanding disk to a fixed-size disk, but you can't change a VM's generation

____

# Monitor
* You can monitor Azure VMs in any region. The VMs themselves aren't limited to the regions supported by the Log Analytics workspace.

____


# NSG
* All NICs assigned to an application security group have to exist in the same VNET1 , NICs in Subnet11 and Subnet12  are linked to VNET1 can be configured in ASG

____


## Routing
* Azure selects the route type, based on the following priority:
  * User-defined route
  * BGP route
  * System route

____


# Security
* Adaptive application controls 
  * are an intelligent and automated solution for defining allow lists of known-safe applications for your machines.Often, organizations have collections of machines that routinely run the same processes. Security Center uses machine learning to analyze the applications running on your machines and create a list of the known-safe software. Allow lists are based on your specific Azure workloads, and you can further customize the recommendations using the instructions below.When you've enabled and configured adaptive application controls, you'll get security alerts if any application runs other than the ones you've defined as safe.

____


# Roles
## Built-In roles
* Contributor
  * Grants full access to manage all resources, but does not allow you to assign roles in Azure RBAC, manage assignments in Azure Blueprints, or share image galleries.
* Owner
  * Grants full access to manage all resources, including the ability to assign roles in Azure RBAC.
* Reader
  * View all resources, but does not allow you to make any changes.
* User Access Administrator
  * Lets you manage user access to Azure resources.
[built-in roles](https://docs.microsoft.com/en-us/azure/role-based-access-control/built-in-roles)

____


# Recovery Service Vault

* You can't delete a vault that contains protected data sources (for example, IaaS VMs, SQL databases, Azure file shares).
* You can't delete a vault that contains backup data. Once backup data is deleted, it will go * into the soft deleted state.
* You can't delete a vault that contains backup data in the soft deleted state.
* You can't delete a vault that has registered storage accounts.

* Enabling recovery
  * Azure VMs
  * Hyper VMs
    * No System Center VMM
      * Hyper-V site
    * Yes System Center VMM
      * System center
    * download Microsoft Azure Site Recovery Provider
    * Download the vault registration key
    * Install AzureSiteRecoveryProvider.exe on each Hyper-V host that you want to add to the Hyper-V site
    * Set up a replication policy
    [tutorial](https://docs.microsoft.com/en-us/azure/site-recovery/hyper-v-azure-tutorial)
  * VMWare VMs

    
  * VMWare VMs

* Site Recovery contributes to your business continuity and disaster recovery (BCDR) strategy, by orchestrating and automating replication of Azure VMs between regions, on-premises virtual machines and physical servers to Azure, and on-premises machines to a secondary datacenter

____

# Domain
* You can use TXT or MX record to verify domain
____

# Storage
* Zone-redundant storage (ZRS) replicates your Azure Storage data synchronously across three Azure availability zones in the primary region. Each availability zone is a separate physical location with independent power, cooling, and networking. ZRS offers durability for Azure Storage data objects of at least 99.9999999999% (12 9's) over a given year.
* Blob storage and V1 wont support ZRS
* Premimum application is available only for the LRS

[sas terms](https://docs.microsoft.com/en-us/answers/questions/67751/azure-sas-terms.html)

## AD Connect
* When you're synchronizing user accounts from Active Directory to Azure AD, ensure that the UPNs in Active Directory map to verified domains in Azure AD.If the value of the userPrincipalName attribute doesn't correspond to a verified domain in Azure AD, the synchronization process replaces the suffix with a default .onmicrosoft.com value.
* To use on premisis creadential for Azure AD sign-in, UPS suffix should match one of the verified custom domain in Azure AD.
* Suppose you have an Azure AD Connect with Password Hash Synchronization feature enabled. When you enable staging mode, the server stops synchronizing password changes from on-premises AD. When you disable staging mode, the server resumes synchronizing password changes from where it last left off. If the server is left in staging mode for an extended period of time, it can take a while for the server to synchronize all password changes that had occurred during the time period.

# Advisor
* Azure Advisor helps you optimize and reduce your overall Azure spend by identifying idle and underutilized resources. You can get cost recommendations from the Cost tab on the Advisor dashboard.

# Virtual Network
* Specify when you want traffic destined for specific address prefixes routed to a virtual network gateway. The virtual network gateway must be created with type VPN. You cannot specify a virtual network gateway created as type ExpressRoute in a user-defined route because with ExpressRoute, you must use BGP for custom routes

# Virtual Network Gateway
* A virtual network gateway is composed of two or more VMs that are deployed to a specific subnet you create called the gateway subnet. Virtual network gateway VMs contain routing tables and run specific gateway services. These VMs are created when you create the virtual network gateway. You can't directly configure the VMs that are part of the virtual network gateway.A virtual network can have two virtual network gateways; one VPN gateway and one ExpressRoute gateway.

# VPN Gateway
* A VPN gateway is a specific type of virtual network gateway that is used to send encrypted traffic between an Azure virtual network and an on-premises location over the public Internet. You can also use a VPN gateway to send encrypted traffic between Azure virtual networks over the Microsoft network. Each virtual network can have only one VPN gateway. However, you can create multiple connections to the same VPN gateway. When you create multiple connections to the same VPN gateway, all VPN tunnels share the available gateway bandwidth
* Yes. The gateway subnet contains the IP addresses that the virtual network gateway services use. You need to create a gateway subnet for your VNet in order to configure a virtual network gateway. All gateway subnets must be named 'GatewaySubnet' to work properly. Don't name your gateway subnet something else. And don't deploy VMs or anything else to the gateway subnet.
* /27 or larger (/27,/26, /25 etc.)

* P2S connection wont' support policy based routing. Required Route based VPN

* Azure Point-to-Site VPN currently supports two protocols for remote access, IKEv2 and SSTP. IKEv2 is supported on many client operating systems including Windows, Linux, macOS, Android, and iOS. SSTP is only supported on Windows. If you **make a change to the topology of your network** and have Windows VPN clients, the VPN client package for Windows clients must be downloaded and **installed again** in order for the changes to be applied to the client


# Azure File Sync 
To centralize your organization's file shares in Azure Files, while keeping the flexibility, performance, and compatibility of an on-premises file server. Azure File Sync transforms Windows Server into a quick cache of your Azure file share. You can use any protocol that's available on Windows Server to access your data locally, including SMB, NFS, and FTPS. You can have as many caches as you need across the world.

* Install the Azure file sync agent on server1
* Register server1
* Add server end point

# Virtual Machine scale sets
* When you deploy a scale set, VM extensions can provide post-deployment configuration and automation tasks, such as installing an app. Scripts can be downloaded from Azure storage or GitHub, or provided to the Azure portal at extension run-time. To apply an extension to your scale set, you add the extensionProfile section to the preceding resource example. The extension profile typically defines the following properties:

* Extension type
* Extension publisher
* Extension version
* Location of configuration or install scripts
* Commands to execute on the VM instances

# General
* Enterprise State Roaming is available to any organization with an Azure AD Premium or Enterprise Mobility + Security (EMS) license

# App Service
* The Backup and Restore feature requires the App Service plan to be in the Standard, Premium or Isolated tier.

# SQL on VM
* An Azure storage account to use for storing Automated Backup files in blob storage. A container is created at this location to store all backup files.

# Service Tags
* *service tags to define network access controls on network security groups or Azure Firewall. Use service tags in place of specific IP addresses when you create security rules. By specifying the service tag name, such as ApiManagement, in the appropriate source or destination field of a rule, you can allow or deny the traffic for the corresponding service.
* You can also use Service Tags in place of explicit IP ranges in user defined routes. This feature is currently in Public Preview.

# Roles
* Name
* Id
* IsCustom
* Description
* Actions []
* NotActions []
* DataActions []
* NotDataActions []
* AssignableScopes []

_____

# Docker
* ADD and COPY are functionally similar, generally speaking, COPY is preferred. That’s because it’s more transparent than ADD. COPY only supports the basic copying of local files into the container, while ADD has some features (like local-only tar extraction and remote URL support) that are not immediately obvious. Consequently, the best use for ADD is local tar file auto-extraction into the image, as in ADD rootfs.tar.xz /.

* COPY Commands
  * Working 
```cmd
  # forward slash
  COPY test1.txt /temp/
  COPY test1.txt c:/temp/
```
  * Non working
```cmd
  # backward slash wont work
  COPY test1.txt c:\temp\
```
  * If either source or destination has space
  ```cmd
  COPY ["<source>", "<destination>"]
  ```
* ADD
  * Is same as COPY
  * In Linux  will expand compressed packages on copy (not available in windows)
[docker container commands](https://docs.microsoft.com/en-us/virtualization/windowscontainers/manage-docker/manage-windows-dockerfile)

* RUN vs CMD vs ENTRYPOINT
  * Use RUN instructions to build your image by adding layers on top of initial image.
  * Prefer ENTRYPOINT to CMD when building executable Docker image and you need a command always to be executed. Additionally use CMD if you need to provide extra default arguments that could be overwritten from command line when docker container runs.
  * Choose CMD if you need to provide a default command and/or arguments that can be overwritten from command line when docker container runs.
  * [more info](https://goinbigdata.com/docker-run-vs-cmd-vs-entrypoint/)
____

# Access Reviews
* Ensure that your directory has at least as many Azure AD Premium P2 licenses and Enterprise Mobility + Security (EMS) E5 license as you have employees that will be performing the following tasks:
  * Users assigned as eligible to Azure AD or Azure roles managed using PIM
  * Users who are assigned as eligible members or owners of privileged access groups
  * Users able to approve or reject activation requests in PIM
  * Users assigned to an access review
  * Users who perform access reviews

# AD Connect
* Domain account - Domain user account  , During installation of AD , a new domain user created and later stage it used for AD connect SYNC
* Enterprise admin used for AD connect installation and not for AD connect SYNC

____

# Azure Sentinel
Microsoft Azure Sentinel is a scalable, cloud-native, security information event management (SIEM) and security orchestration automated response (SOAR) solution. Azure Sentinel delivers intelligent security analytics and threat intelligence across the enterprise, providing a single solution for alert detection, threat visibility, proactive hunting, and threat response.

# Identity Protection
* Identity Protection is a tool that allows organizations to accomplish three key tasks:
  * Automate the detection and remediation of identity-based risks.
  * Investigate risks using data in the portal.
  * Export risk detection data to your SIEM.

* Protect
  * User risk policy
  * Sign-in risk policy
  * MFA registration policy
* Report
  * Risky users
  * Risky sign-ins
  * Risk detection
* Notify
  * Users at risk detected alerts
  * Weekly digest
____
# Azure Security Center (Microsoft Defender)
Defender for Cloud is a tool for security posture management and threat protection. It strengthens the security posture of your cloud resources, and with its integrated Microsoft Defender plans, Defender for Cloud protects workloads running in Azure, hybrid, and other cloud platforms.
* compliance dashboard to review your compliance with the built-in benchmark.

* **Sentinel deep investigation** tools helps in understanding thes scope and finding the root cause of potential thread.
* **Sentinel powerful hunting search and query tools** allow to proactively hunt for security threats across the data sources of the organization before an alerts is triggered. it does not help in finding the root cause of the problem.

____

# Function Apps
* Plans
  * Consumption
  * Premimum
  * App Service
    * You have existing, underutilized VMs that are already running other App Service instances.
    * Predictive scaling and costs are required.

  [plans](https://docs.microsoft.com/en-us/azure/azure-functions/functions-scale?WT.mc_id=Portal-WebsitesExtension)

  ___

  # MFA and SSPR (Single signon password reset)
  ![mfa](./images/mfa_sspr.png)
  
  ___

  # Containers
  Windows containers provider do isolation models
  * Process
    * Share the same kernel.
  * Hyper-V
    * Donot run the same kernel. Creates highly optimized virtual machines.
    
  # SSPR
  * Require Premimum P1 license
  * Admins are always enabled for self-service password reset and are required to use two authentication methods to reset their password. Click here to learn more about administrator password policies.