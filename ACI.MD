* create image and push
    *   az acr build --registry saireg --image helloacrbuild:v70 --resource-group saireg --timeout 3600 .

* deploy
ACR_NAME=saireg
AKV_NAME=$ACR_NAME-vault
RES_GROUP=$ACR_NAME # Resource Group name

acr-build-saireg.eastus.azurecontainer.io

az container create \
    --resource-group $RES_GROUP \
    --name acr-build \
    --image $ACR_NAME.azurecr.io/helloacrbuild:v70 \
    --registry-login-server +++$ACR_NAME.azurecr.io \
    --registry-username $(az keyvault secret show --vault-name $AKV_NAME --name $ACR_NAME-pull-usr --query value -o tsv) \
    --registry-password $(az keyvault secret show --vault-name $AKV_NAME --name $ACR_NAME-pull-pwd --query value -o tsv) \
    --dns-name-label acr-build-$ACR_NAME \
    --query "{FQDN:ipAddress.fqdn}" \
    --output table

* verifying
    * az container attach --resource-group $RES_GROUP --name acr-build

* Deleting
    * az container delete --resource-group $RES_GROUP --name acr-build

* See what is the container Ip
    * az container show --resource-group saireg --name acr-build
    * az container show --resource-group saireg --name acr-build --query "ipAddress.ip"  ( take the public ip and use it.)

* See logs
    * az container logs --resource-group $RES_GROUP --name acr-build

* See the repository
    * az acr repository list --resource-group saireg --name saireg
* See the images
    * az acr repository  show --name saireg --repository helloacrbuild  
    * az acr repository  show-tags --repository helloacrbuild --name saireg
* Delete the image
    * az acr repository delete -n saireg --image helloacrbuild:v1
* Execute command
    * az container exec  --name acr-build --resource-group saireg --exec-command "/bin/sh"
    
    * netstat   ( to see the ports)
    * printenv  ( to print environment )
    * <name>=<value> ( set environment )
    * ps  ( list processes )
     
[Tutorial: Build container images in the cloud with Azure Container Registry Build](https://docs.microsoft.com/en-us/azure/container-registry/container-registry-tutorial-quick-build)
    