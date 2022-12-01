# Helper method
function StartService($ServiceName) {
  $arrService = Get-Service -Name $ServiceName

  while ($arrService.Status -ne 'Running')
  {
    if ($arrService.StartType -ne 'Automatic')
    {
        Set-Service $ServiceName -StartupType Automatic
        write-host $arrService.starttype
    }
    Start-Service $ServiceName
    write-host $arrService.status
    write-host 'Service starting'
    Start-Sleep -seconds 5
    $arrService.Refresh()
    if ($arrService.Status -eq 'Running')
    {
      Write-Host "Service '$ServiceName' is now Running"
    }
  }
}

# Services to ensure is started
StartService('DOT3SVC')
pause