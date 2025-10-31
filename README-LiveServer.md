Live Server — Quick setup for this workspace

This repository root is: `c:\Users\Marsden Maima\Desktop\Project_site`

What I added for you:
- `.vscode/settings.json` — default Live Server settings (port 5500, Chrome as custom browser)
- `scripts/install-live-server.ps1` — PowerShell script to install the Live Server extension via the `code` CLI
- `README-LiveServer.md` — this file (how to use everything)

Quick install & run (PowerShell)
1. Open PowerShell in the workspace root (or open the folder in VS Code).
2. To install Live Server via the VS Code CLI (optional):

```powershell
# from the workspace root
.\scripts\install-live-server.ps1
```

3. If you prefer the GUI: in VS Code press Ctrl+Shift+X, search for "Live Server" by Ritwick Dey and install it.

Start Live Server
1. Open `index.html` in VS Code.
2. Click "Go Live" in the bottom-right status bar, or right-click the editor and choose "Open with Live Server", or use the Command Palette: Ctrl+Shift+P -> "Live Server: Open with Live Server".
3. Live Server will open your default browser at http://127.0.0.1:5500 (or the port you configured).

Troubleshooting
- "Go Live" not visible: ensure the folder `c:\Users\Marsden Maima\Desktop\Project_site` is opened as workspace root (File -> Open Folder...).
- `code` CLI not found: in VS Code open Command Palette -> type "Shell Command: Install 'code' command in PATH" (on Windows, follow docs to add the CLI). Alternatively install the extension from the Extensions view.
- Port in use: change `liveServer.settings.port` in `.vscode/settings.json`.
- Browser doesn't open: Live Server may open the system default; change `liveServer.settings.CustomBrowser` in the settings file (use browser name like "chrome", "firefox", etc.).
- Using WSL/Remote: install Live Server in the remote/WSL extension host (open the remote window and install the extension there).

If you want, I can also:
- Add a tiny VS Code task to start Live Server (not necessary, but possible), or
- Automatically open `index.html` in the browser by adding a launch helper.

Let me know which next step you want.
