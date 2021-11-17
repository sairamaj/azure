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
  
* Password write back
  * A working Azure AD tenant with at least an Azure AD Premium P1 or trial license enabled.
  * An account with global administrator privileges.
  * Azure AD configured for self-service password reset.
  * An existing on-premises AD DS environment configured with a current version of Azure AD Connect.
  * To use password writeback, your Domain Controllers must be Windows Server 2016 or later.

____

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

*  Use a system-assigned identity for a Windows virtual machine (VM) to access Azure SQL Database. Managed Service Identities are automatically managed by Azure and enable you to authenticate to services that support Azure AD authentication, without needing to insert credentials into your code.
  * Create a contained user in the database that represents the VM's system assigned identity
  * Get an access token using the VM identity and use it to query Azure SQL Database

* Microsoft SQL Server Always On availability group on Azure virtual machines.You need to configure an Azure internal load balancer as a listener for the availability group. Backend port should use Floating IP

* The elastic query feature (in preview) enables you to run a Transact-SQL query that spans multiple databases in Azure SQL Database

* Azure SQL Database elastic pools are a simple, cost-effective solution for managing and scaling multiple databases that have varying and unpredictable usage demands. The databases in an elastic pool are on a single server and share a set number of resources at a set price.
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
____

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

_______

# General
* You are developing a speech-enabled home automation control bot.The bot interprets some spoken words incorrectly.You need to improve the spoken word recognition for the bot.
What should you implement?
* The web channel chat and Speech priming using Bing Speech and Service and LUIS app.

* You have an Azure subscription.You create an Azure web app named Contoso1812 that uses an S1 App service plan.You create a DNS record for www.contoso.com that points to the IP address of Contoso1812.You need to ensure that users can access ontoso1812 by using the https://www.contoso.com URL. Which two actions should you perform? Each correct answer presents part of the solution.
* Add host name to Contoso1812
* Upload PFX file to Contoso1812

* To deny storage account to public access
```powershell
Update-AzStorageAccountNetworkRuleSet -DefaulAction Deny -ResourceGroupName rg -Name storageaccount
```
