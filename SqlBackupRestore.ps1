Param(
  [string]$sqlInstanceName,
  [string]$databaseName,
  [string]$backupFile
)

[Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SMO") | Out-Null
[Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SmoExtended") | Out-Null
[Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.ConnectionInfo") | Out-Null
[Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SmoEnum") | Out-Null

$srv = new-object ('Microsoft.SqlServer.Management.Smo.Server') $sqlInstanceName

$srv.ConnectionContext.LoginSecure=$true; 

$srv.KillAllProcesses($databaseName);

$backupDevice = New-Object Microsoft.SqlServer.Management.Smo.BackupDeviceItem($backupFile, 'File')
$smoRestore = New-Object Microsoft.SqlServer.Management.Smo.Restore


$smoRestore.NoRecovery = $false
$smoRestore.ReplaceDatabase = $true
$smoRestore.Action = 'Database'

$smoRestore.Devices.Add($backupDevice)
$smoRestore.Database = $databaseName
$smoRestore.SqlRestore($srv)

"Restoration complete"
