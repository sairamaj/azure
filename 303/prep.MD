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

