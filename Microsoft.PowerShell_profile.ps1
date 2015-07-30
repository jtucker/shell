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

# Aliases
New-Alias which get-command
New-Alias code "$env:LOCALAPPDATA\Code\bin\code.cmd"

# Load posh-git example profile
. '~\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1'

Import-Module PSGet
Import-Module PSReadLine

# Load the PowerShell Snap-In (if not available, then just move on.)
Add-PSSnapin -Name Microsoft.SharePoint.PowerShell -ErrorAction Continue
