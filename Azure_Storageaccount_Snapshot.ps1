$tenantId = ""
$clientId = ""
$clientSecret = ""
$secureSecret = ConvertTo-SecureString $clientSecret -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential($clientId, $secureSecret)
$resourceGroup = "RG_EL_WE_01"
$storageAccount = "ellispremiumprod"
$fileShareName = "ftpdataprod"
$cutoffDate = (Get-Date).AddDays(-$daysOld)
 
Connect-AzAccount -ServicePrincipal -Tenant $tenantId -Credential $cred
Set-AzContext -SubscriptionId "138c16cd-4619-4e52-a9c8-823391fc28f1"

$snapshots = Get-AzRmStorageShare -ResourceGroupName $resourceGroup -StorageAccountName $storageAccount -IncludeSnapshot | Where-Object { $_.SnapshotTime -ne $null }

foreach ($snapshot in $snapshots) {
    Remove-AzRmStorageShare -ResourceGroupName $resourceGroup -StorageAccountName $storageAccount -Name $fileShareName -SnapshotTime $snapshot.SnapshotTime -Force
}

New-AzRmStorageShare -ResourceGroupName $resourceGroup -StorageAccountName $storageAccount -Name $fileShareName -Snapshot

