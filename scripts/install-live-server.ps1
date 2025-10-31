# Install Live Server for VS Code (PowerShell script)
# Run this from PowerShell: .\scripts\install-live-server.ps1

if (Get-Command code -ErrorAction SilentlyContinue) {
    Write-Host "Installing Live Server extension (ritwickdey.LiveServer)..."
    code --install-extension ritwickdey.LiveServer
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Live Server installed successfully."
        Write-Host "If VS Code is running, reload the window (Ctrl+Shift+P -> 'Developer: Reload Window')."
    } else {
        Write-Host "The 'code' command returned a non-zero exit code. You may need to run the command manually in a terminal or install the 'code' CLI in PATH."
    }
} else {
    Write-Host "The 'code' command is not available in PATH."
    Write-Host "To enable it: open VS Code -> Command Palette -> 'Shell Command: Install 'code' command in PATH' (or see VS Code docs for Windows)."
}
