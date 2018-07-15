# Resource Group
* az group show --name <name here>
* az group list --query "[].{properties}" --output table

# VMs
* az vm list --query "[].name"
* az vm start --name dockerUseVm --resource-group KuberneteTutorial  (start)

# Network
* az network lb list

# Azure Container Registry
* az acr repository list --name KuberneteTutorialRegistry  ( list the images)
* 