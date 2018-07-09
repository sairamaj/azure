#!/bin/sh

# Update for your admin password
AdminPassword=Password13579!


# Create a resource group.
az group create --name KuberneteTutorial --location westus

# Create a virtual machine. 
az vm create \
    --resource-group KuberneteTutorial \
    --name myVM \
    --image win2016datacenter \
    --admin-username azureuser \
    --admin-password $AdminPassword 
