New-Variable -Name Key
New-Variable -Name PromptOnSecureDesktop_Name
New-Variable -Name ConsentPromptBehaviorAdmin_Name

function Set-RegistryValue($key, $name, $value, $type = "Dword") {
    if ((Test-Path -Path $key) -Eq $false) { New-Item -ItemType Directory -Path $key | Out-Null }
    Set-ItemProperty -Path $key -Name $name -Value $value -Type $type
}

function Get-RegistryValue($key, $value) {
   (Get-ItemProperty $key $value).$value
}

$Key = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$ConsentPromptBehaviorAdmin_Name = "ConsentPromptBehaviorAdmin"
$PromptOnSecureDesktop_Name = "PromptOnSecureDesktop"

function Get-UACLevel() {
    $ConsentPromptBehaviorAdmin_Value = Get-RegistryValue $Key $ConsentPromptBehaviorAdmin_Name
    $PromptOnSecureDesktop_Value = Get-RegistryValue $Key $PromptOnSecureDesktop_Name

    if ($ConsentPromptBehaviorAdmin_Value -Eq 0 -And $PromptOnSecureDesktop_Value -Eq 0) {
        "Never notify."
    }
    elseif ($ConsentPromptBehaviorAdmin_Value -Eq 5 -And $PromptOnSecureDesktop_Value -Eq 0) {
        "Notify me only when apps try to make changes to my computer(do not dim my desktop)."
    }
    elseif ($ConsentPromptBehaviorAdmin_Value -Eq 5 -And $PromptOnSecureDesktop_Value -Eq 1) {
        "Notify me only when apps try to make changes to my computer(default)."
    }
    elseif ($ConsentPromptBehaviorAdmin_Value -Eq 2 -And $PromptOnSecureDesktop_Value -Eq 1) {
        "Always notify."
    }
    else {
        "Error. Cannot get UAC level."
    }
}

function Set-UACLevel() {
    param([int]$Level = 2)

    if (!(Test-Elevated)) {
        Write-Output "Access Denied. Run with Administrator privileges."
        return
    }

    New-Variable -Name PromptOnSecureDesktop_Value
    New-Variable -Name ConsentPromptBehaviorAdmin_Value
    if ($Level -In 0, 1, 2, 3) {
        $ConsentPromptBehaviorAdmin_Value = 5
        $PromptOnSecureDesktop_Value = 1
        switch ($Level) {
            0 {
                $ConsentPromptBehaviorAdmin_Value = 0
                $PromptOnSecureDesktop_Value = 0
            }
            1 {
                $ConsentPromptBehaviorAdmin_Value = 5
                $PromptOnSecureDesktop_Value = 0
            }
            2 {
                $ConsentPromptBehaviorAdmin_Value = 5
                $PromptOnSecureDesktop_Value = 1
            }
            3 {
                $ConsentPromptBehaviorAdmin_Value = 2
                $PromptOnSecureDesktop_Value = 1
            }
        }
        Set-RegistryValue -Key $Key -Name $ConsentPromptBehaviorAdmin_Name -Value $ConsentPromptBehaviorAdmin_Value
        Set-RegistryValue -Key $Key -Name $PromptOnSecureDesktop_Name -Value $PromptOnSecureDesktop_Value

        Get-UACLevel
    }
    else {
        "Level: $Level, is not supported."
    }
}

Export-ModuleMember -Function Get-UACLevel
Export-ModuleMember -Function Set-UACLevel
