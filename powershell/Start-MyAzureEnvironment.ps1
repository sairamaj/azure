
Import-Module .\AzureCommon.psm1
Login

Select-AzureRmSubscription -SubscriptionName 'Visual Studio Enterprise'
$OldResourceGroupName = 'Default-ActivityLogAlerts'
$ResourceGroupName = 'dev'
$VMName = 'dev'
$LoadbalancerName = 'dev-lb'

if( $false -eq (Test-VMRunning -Name $VMName -ResourceGroupName $OldResourceGroupName) ){
    Write-Host "Starting Virtual machine:$VMName"
    Start-AzureRmVM -Name $VMName -ResourceGroupName $OldResourceGroupName
}else{
    Write-Host "VM: $VMName is already running."
}

Write-Host "Getting public ipaddress to be connected"
Get-AzureRmPublicIpAddress -ResourceGroupName $ResourceGroupName | select IPAddress

