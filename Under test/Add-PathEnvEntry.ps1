<#
  .SYNOPSIS
  Adds a new entry in the PATH Environment variable.
  
  .DESCRIPTION
  Updates the PATH environment variable with a new path entry, so commands from that location are available for lookup from CMD.
  
  .EXAMPLE
  Add-PAthEnvEntry 'C:\MyCommands'

  #>
Param(
    [string]$newPath
)

#Validate path
if(-not $newPath)
{
    throw "Must specify a path to add"
}

if( -not (Test-Path $newPath))
{
    throw "Invalid path. Must be a correct path that maps to an existing location"
}

#Constants
$registryEntry = 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment'

#Normalize the path to be drive rooted.
$newPath = [System.IO.Path]::GetFullPath($newPath)

#Gets the current path.
$pathBefore = (Get-ItemProperty -Path $registryEntry -Name PATH).Path

#Paths may have a trailing semicolon.
$separator = $null
if( -not $pathBefore.EndsWith(';'))
{
    $separator = ';'
}

#Building and updating the final string.
$pathUpdated = $pathBefore + $separator + $newPath

Set-ItemProperty -Path $registryEntry -Name PATH –Value $pathUpdated