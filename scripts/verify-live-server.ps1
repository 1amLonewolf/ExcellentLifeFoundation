# verify-live-server.ps1
# Polls Live Server at localhost:5500 until it responds, then opens the URL in the default browser.
# Usage: .\scripts\verify-live-server.ps1

$uri = 'http://127.0.0.1:5500'
$timeoutSeconds = 30
$intervalSeconds = 1
$endTime = (Get-Date).AddSeconds($timeoutSeconds)

Write-Host "Checking $uri for up to $timeoutSeconds seconds..."
while ((Get-Date) -lt $endTime) {
    try {
        $resp = Invoke-WebRequest -Uri $uri -UseBasicParsing -TimeoutSec 5 -ErrorAction Stop
        if ($resp.StatusCode -ge 200 -and $resp.StatusCode -lt 400) {
            Write-Host "Live Server is up at $uri"
            Start-Process $uri
            exit 0
        }
    } catch {
        # not ready yet
    }
    Start-Sleep -Seconds $intervalSeconds
}
Write-Host "Timed out waiting for Live Server at $uri. Make sure Live Server is running (click 'Go Live' in VS Code) and try again." 
exit 1
