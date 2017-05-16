Set-AzureRmContext -SubscriptionID '<subscription id here'
#New-AzureRmResourceGroup -Name ExampleGroup -Location "West US"
# New-AzureRmResourceGroupDeployment -Name ExampleDeployment -ResourceGroupName ExampleGroup -TemplateFile .\CreateStorageAccountSample.json
# with properties specified.
#New-AzureRmResourceGroupDeployment -Name ExampleDeployment -ResourceGroupName ExampleGroup -TemplateFile .\CreateStorageAccountSample.json -storageNamePrefix "testing"
# removing
Remove-AzureRmResourceGroup -Name ExampleGroup
 