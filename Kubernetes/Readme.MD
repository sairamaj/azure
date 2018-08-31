
# using Azure Cloud Shell [Deploy an Azure Kubernetes Service (AKS) cluster](https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough)
; creates a resource group
az group create --name myResourceGroup --location westus
; create AKS (Azure Kubernetes) cluster
az aks create --resource-group myResourceGroup --name myAKSCluster --node-count 1 --generate-ssh-keys
; If not using Cloud shell then one can install __kubectl__ with the following command
az aks install-cli  
; Configure kubectl to connect to Kubernetes cluster
az aks get-credentials --resource-group myResourceGroup --name myAKSCluster
; Verify the connection
kubectl get nodes
; Create manifest (used Nano editor - use Shift+Ins for paste)
; To run the application
kubectl apply -f azure-vote.yaml
; To see the progress
kubectl get-service azure-vote-front --watch
; to see the list of cluster
az aks list
; finally delete the group
az 

## Resources
[kubernetes.io](https://kubernetes.io/)
[Webnairs](https://github.com/ernesen/kubernetes)
