param (
    [Parameter(Mandatory=$true)][string]$FilePath,
    [Parameter(Mandatory=$true)][string]$Token
)

$Endpoint = "https://api.remotefilebridge.com/prod/upload"

if (-Not (Test-Path $FilePath)) {
    Write-Error "File $FilePath does not exist."
    exit
}

# Simple MIME type determination (you might want to expand this based on your needs)
$extension = [System.IO.Path]::GetExtension($FilePath).ToLower()
$MIMEType = switch ($extension) {
    '.txt' { 'text/plain' }
    '.jpg' { 'image/jpeg' }
    '.jpeg' { 'image/jpeg' }
    '.png' { 'image/png' }
    Default { 'application/octet-stream' } # Default generic binary stream MIME type
}

$FileName = [System.IO.Path]::GetFileName($FilePath)

$Headers = @{
    "Content-Type" = $MIMEType
    "security-token" = $Token
    "file-name" = $FileName
}

$Content = Get-Content $FilePath -Raw -Encoding Byte

$response = Invoke-RestMethod -Uri $Endpoint -Method Post -Headers $Headers -Body $Content -TimeoutSec 300

Write-Output $response
