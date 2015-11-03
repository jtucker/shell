Function Touch-File
{
    $file = $args[0]
    if($file -eq $null) {
        throw "No filename supplied"
    }

    if(Test-Path $file)
    {
        (Get-ChildItem $file).LastWriteTime = Get-Date
    }
    else
    {
        echo $null > $file
    }
}

Function gig {
  param(
    [Parameter(Mandatory=$true)]
    [string[]]$list
  )
  $params = $list -join ","
  Invoke-WebRequest -Uri "https://www.gitignore.io/api/$params" | select -ExpandProperty content | Out-File -FilePath $(Join-Path -path $pwd -ChildPath ".gitignore") -Encoding ascii
}

# Aliases
New-Alias which get-command

# Load posh-git example profile
. '~\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1'

Import-Module PSGet
Import-Module PSReadLine

# Load the PowerShell Snap-In (if not available, then just move on.)
Add-PSSnapin -Name Microsoft.SharePoint.PowerShell -ErrorAction Continue
