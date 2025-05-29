@echo off
set FILE=%1
set FILE=%FILE:"=%
"C:\Program Files\WezTerm\wezterm.exe" start -- nvim "%FILE%"
