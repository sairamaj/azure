Set-AzureRmContext -SubscriptionID '821d6eee-fe66-4c21-8e8b-ab80122b0d35'
#New-AzureRmResourceGroup -Name ExampleGroup -Location "West US"
# New-AzureRmResourceGroupDeployment -Name ExampleDeployment -ResourceGroupName ExampleGroup -TemplateFile .\CreateStorageAccountSample.json
# with properties specified.
#New-AzureRmResourceGroupDeployment -Name ExampleDeployment -ResourceGroupName ExampleGroup -TemplateFile .\CreateStorageAccountSample.json -storageNamePrefix "testing"
# removing
Remove-AzureRmResourceGroup -Name ExampleGroup
