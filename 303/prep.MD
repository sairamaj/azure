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

 # Monitoring
 * **SMS**: No more than 1 SMS every 5 minutes.
 * **Voice**: No more than 1 Voice call every 5 minutes.
 * **Email**: No more than 100 emails in an hour
 [rate limits](https://docs.microsoft.com/en-us/azure/azure-monitor/alerts/alerts-rate-limiting)

 # Load Balancer
 A public load balancer can provide outbound connections for virtual machines (VMs) inside your virtual network. These connections are accomplished by translating their private IP addresses to public IP addresses. Public Load Balancers are used to load balance internet traffic to your VM.

 * Standard is recommended for production workloads.
 * Basic load balancer doesn't support zones.
 * A **zone redundant** Load Balancer can serve a zonal resource in any zone with one IP address. The IP can survive one or more zone failures as long as at least one zone remains healthy within the region.
* A **zonal frontend** is a reduction of the service to a single zone and shares fate with the respective zone. If the zone your deployment is in goes down, your deployment will not survive this failure

* The outbound rules tab is only valid for a public standard load balancer. Outbound rules are not supported on an internal or basic load balancer. Azure Virtual Network NAT is the recommended way to provide outbound internet access for the backend pool.

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
### WebJobs
Schedule uses [Ncrontab](https://github.com/atifaziz/NCrontab)
* {second} {minute} {hour} {day} {month} {day-of-week}

# Azure Backup
A Recovery Services vault is a logical container that stores the backup data for each protected resource, such as Azure VMs. When the backup job for a protected resource runs, it creates a recovery point inside the Recovery Services vault. You can then use one of these recovery points to restore data to a given point in time.

* **M**icrosoft **A**zure **R**ecovery **S**ervices agent
  * Runs on individual on-premises Windows Server machines to back up files, folders, and the system state.
  * Runs on Azure VMs to back up files, folders, and the system state.
  * Runs on DPM/MABS servers to back up the DPM/MABS local storage disk to Azure.
* Azure VM extension
  * Runs on Azure VMs to back them up to a vault.

To create a vault to protect any data source, the vault must be in the same region as the data source.

# Azure AD
## Device Management
Get device identity
* Azure AD registration
* Azure AD Join
  * Windows 10
  * Windows Server 2019
* Hybrid Azure AD Join
  * Windows 7 and Server 2008 onwards
