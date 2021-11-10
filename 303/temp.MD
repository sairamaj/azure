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

* Site Recovery contributes to your business continuity and disaster recovery (BCDR) strategy, by orchestrating and automating replication of Azure VMs between regions, on-premises virtual machines and physical servers to Azure, and on-premises machines to a secondary datacenter

____


# Domain
* You can use TXT or MX record to verify domain

# Storage
* Zone-redundant storage (ZRS) replicates your Azure Storage data synchronously across three Azure availability zones in the primary region. Each availability zone is a separate physical location with independent power, cooling, and networking. ZRS offers durability for Azure Storage data objects of at least 99.9999999999% (12 9's) over a given year.
* Blob storage and V1 wont support ZRS

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

# Docker
* ADD and COPY are functionally similar, generally speaking, COPY is preferred. That’s because it’s more transparent than ADD. COPY only supports the basic copying of local files into the container, while ADD has some features (like local-only tar extraction and remote URL support) that are not immediately obvious. Consequently, the best use for ADD is local tar file auto-extraction into the image, as in ADD rootfs.tar.xz /.

# Access Reviews
* Ensure that your directory has at least as many Azure AD Premium P2 licenses as you have employees that will be performing the following tasks:
  * Users assigned as eligible to Azure AD or Azure roles managed using PIM
  * Users who are assigned as eligible members or owners of privileged access groups
  * Users able to approve or reject activation requests in PIM
  * Users assigned to an access review
  * Users who perform access reviews

# AD Connect
* Domain account - Domain user account  , During installation of AD , a new domain user created and later stage it used for AD connect SYNC
* Enterprise admin used for AD connect installation and not for AD connect SYNC

