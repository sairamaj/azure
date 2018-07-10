; to show the resource group  
az group show --name <name here>

; to use group list with jpath  
az group list --query "[].{properties}" --output table