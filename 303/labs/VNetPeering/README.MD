# Purpose
VNETs peering

# Setup
* Network-1(subscription-premimum)
  * rg-vnet1 (westus-2)
  * vnet1
    * 10.2.0.0/16
    * default subnet 10.2.1.0/24
  * vm1(westus-2)

* Network-2(subscription-enterprise)
  * rg-vnet2 (westus-2)
  * vnet1
    * 10.3.0.0/16
    * default subnet 10.3.1.0/24
  * vm2(westus-2)

* Network-3 (subscription-premimum)
  * rg-vnet3 (westus-2)
  * vnet1
    * 10.4.0.0/16
    * default subnet 10.4.1.0/24
  * vm3(westus-2)

* Network-4 (subscription-premimum)
  * rg-vnet3 (eastus-2)
  * vnet1
    * 10.1.0.0/16
    * default subnet 10.5.1.0/24
  * vm3(eastus-2)

___

# Steps
* Logon to vm1
* Tried to RDP 10.3.1.4
* Failed
* Lets try vnet1 peer to vnet2
  * Used portal to add vnet1-vnet2
  * 2 VNets peerings were created automatically.
  * Able to RDP to 10.3.1.4 and succeeded.

* Added vnet1-vnet4 peering (acrosss region)
* RDP in to 10.1.1.4 (from westus-2 vm to east-us)