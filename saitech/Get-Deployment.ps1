for($i = 0 ; $i -lt 10; $i++)
{
    $status = Get-AzureRmResourceGroupDeployment -Name TestAutomationDeployment3 -ResourceGroupName deleteme
    $status.ProvisioningState
    Start-Sleep -Seconds 30
}
