# Profile for the Visual Studio Shell, only. (e.g. Package Manager Console)
# ===========

function Reinstall-Package {
  param(
    [Parameter(Mandatory = $true)]
    [string]
    $Id,

    [Parameter(Mandatory = $true)]
    [string]
    $Version,

    [Parameter(ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
    [string]
    $ProjectName,

    [switch]
    $Force
  )

  if (-not $ProjectName) { $ProjectName = (get-project).ProjectName }

  Uninstall-Package -ProjectName $ProjectName -Id $Id -Force:$Force
  Install-Package -ProjectName $ProjectName -Id $Id -Version $Version
}

# Wire StudioShell functions if exist
if ($null -ne (Get-Module -ListAvailable StudioShell)) {
  Import-Module StudioShell
}
