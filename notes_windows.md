# Windows setup notes

``` sh
winget install --id Microsoft.Powershell --source winget
winget install BurntSushi.ripgrep.MSVC
winget install sharkdp.fd
winget install fzf
winget install ajeetdsouza.zoxide
Set-Content -Path "C:\Users\AlexEski\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" -Value "Invoke-Expression (& { (zoxide init powershell | Out-String)})"
winget install Neovim.Neovim
winget install --id Git.Git -e --source winget
winget install zig.zig

z AppData\Local
mkdir nvim
git clone https://github.com/a-eski/neovim-config.git .\nvim
```

## msys2, if you want to install as well
https://www.msys2.org/
https://stackoverflow.com/questions/71045716/adding-msys-to-windows-terminal

## wsl
https://learn.microsoft.com/en-us/windows/wsl/install
