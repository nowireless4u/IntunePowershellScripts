function Test-TlsVersion {
    
    Param(
    
        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]$Path,
    
        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]$Name
    )
    
    $Value = '3072'

    try {
       $TlsValue = Get-ItemProperty -Path $Path | Select-Object -ExpandProperty $Name -ErrorAction Stop
         if($TlsValue -eq '3072')
         {
            Write-Host 'TLS version is 1.2'
            New-ItemProperty -Path $Path -Name $Name -Value $Value -PropertyType DWORD -Force
         }
         return $true
         }
        
        catch {
        
         Write-Host 'TLS version is not set'
         New-ItemProperty -Path $Path -Name $Name -Value $Value -PropertyType DWORD -Force
         return $false
        
        }
        
    }

$Path = 'HKLM:\SYSTEM\CurrentControlSet\Services\RasMan\PPP\EAP\13'
$Name = 'TlsVersion'

Test-TlsVersion -Path $Path -Name $Name
pause