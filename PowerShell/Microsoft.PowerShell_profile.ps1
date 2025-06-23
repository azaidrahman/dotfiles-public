#Import-Module PSProfiler
#Measure-script  {

#Write-Output "Start"
#Import-Module -Name Terminal-Icons
# Post-Git
Import-Module -Name posh-git
# Tab Predictor
Import-Module -Name PSReadLine
#Import-Module -Name CompletionPredictor 
Import-Module mkcd

#Import-Module Az.Tools.Predictor
# Oh my Posh settings
#oh-my-posh --init --shell pwsh --config ~/AppData/Local/Programs/oh-my-posh/themes/iterm2.omp.json| Invoke-Expression

# Set admin
#Measure-Script {
#Function Admin-Setting
#{Start-Process powershell -Verb RunAs
#}
#Set-Alias -Name setAdmin -Value Admin-Setting -Description "Create new shell with admin privileges"

Set-Alias nn nvim -force
Set-Alias ll lazygit -force

# Powershell FuzzyFinder

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' 
#-PSReadlineChordReverseHistory 'Ctrl+r'

## Alt-C to Set location based on Selected Dir
## example command - use $Location with a different command
#$commandOverride = [ScriptBlock]{ param($Location) Write-Host $Location 
## pass your override to PSFzf
#Set-PsFzfOption -AltCCommand $commandOverride

## Tab Completion
#Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion 
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView

#Set-PsFzfOption -TabExpansion
#Set-PsFzfOption -EnableAliasFuzzySetEverything


Set-PSReadLineKeyHandler -Key Ctrl+p -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key Ctrl+n -Function HistorySearchForward

Invoke-Expression (& { (zoxide init powershell | Out-String) })
#}

