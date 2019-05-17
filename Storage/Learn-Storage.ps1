# create new storage account
$ResourceGroupName = 'deleteme'
$StorageAccountName = "storagedeleteme"
$ContainerName = "container-deleteme"

$StorageAccount = Get-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $StorageAccountName
if( $null -ne $StorageAccount){
    Write-Warning "$StorageAccountName already exists."
}else{
    $StorageAccount = New-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $StorageAccountName -SkuName "Standard_ZRS" -Location "westUS"
    Write-Host "$StorageAccount is created successfully." -ForegroundColor Green
}

$Container = Get-AzStorageContainer -Name $ContainerName -Context $StorageAccount.Context
if( $null -ne $ContainerName){
    Write-Warning "$($Container.Name) exists already."
}else{
    $Container = New-AzStorageContainer -Name $ContainerName -Context $StorageAccount.Context
    Write-Host "$($Container.Name) created successfully." -ForegroundColor Green
}

Function UploadFile{
    param(
        $Container,
        $FileName
    )

    Set-AzStorageBlobContent -File $FileName  
}
