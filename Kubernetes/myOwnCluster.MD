* Created VM for 2016
    * using scripts\createvm
* Enabled Containers
    * Enable-WindowsOptionalFeature -Online -FeatureName containers –All
    * Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V –All
    * Restart-Computer
* Install docker
    * https://store.docker.com/editions/community/docker-ce-desktop-windows

* Docker commands to create and test
    * docker-compose build
    * docker-compose up -d
    * docker inspect network nat
    * docker-compose ps
    * docker-compose rm

* Create Azure container registry
    * az acr cte --resource-group KuberneteTutorial --name KuberneteTutorialRegistry --sku Basic
    * az acr login --name KuberneteTutorialRegistry
* Tagging local images with Azure Container Registry login server
    * az acr list --resource-group KuberneteTutorial --query "[].loginServer"
    * docker tag docker_oauth kubernetetutorialregistry.azurecr.io/docker_oauth:v1
* Pushing the image
    * docker push kubernetetutorialregistry.azurecr.io/docker_oauth:v1
* Listing the images in ACR
    * az acr repository list --name KuberneteTutorialRegistry
    * az acr repository show-tags --name KuberneteTutorialRegistry --repository docker_oauth --output table

* Deploying to Kubertenes
    * az ad sp create-for-rbac --skip-assignment  ( create service principal in AD)
    * az acr show --name KuberneteTutorialRegistry --resource-group KuberneteTutorial --query "id" --output tsv ( to get ACR resource id )
    * az role assignment create --assignee 0fdc2483-7d13-4567-aca4-0b8be6fd2f52 --role Reader --scope /subscriptions/821d6eee-fe66-4c21-8e8b-ab80122b0d35/resourceGroups/KuberneteTutorial/providers/Microsoft.ContainerRegistry/registries/KuberneteTutorialRegistry (grant access for the AKS cluster to use images stored in ACR)
    * Creating Kuberntetes cluster
        * Linux
            * az aks create --name KuberneteTutorialCluster --resource-group KuberneteTutorial --node-count 1 --generate-ssh-keys --service-principal 0fdc2483-7d13-4567-aca4-0b8be6fd2f52 --client-secret 159cf536-3fee-4dee-b029-6b739b4892db (SSH keys will be generated c:\users\azueruser\.ssh)
        * Windows
            az acs create --orchestrator-type=kubernetes \
                --resource-group myResourceGroup \
                --name=myK8sCluster \
                --agent-count=2 \
                --generate-ssh-keys \
                --windows --admin-username azureuser \
                --admin-password myPassword12



* Troubleshooting
    * kubectl get pods
    * kubectl logs <podname>
    * kubectl describe pods <podname>
    * kubectl get nodes --show-labels


https://docs.microsoft.com/en-us/azure/aks/tutorial-kubernetes-deploy-cluster

