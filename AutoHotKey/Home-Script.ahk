#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; === SYMBOLS ===
; !   <- Alt
; +   <- Shift
; ^   <- Ctrl
; #   <- Win

; #Include %A_ScriptDir%\desktop_switcher.ahk
; return

;~ #InstallKeybdHook
;~ #KeyHistory
;~ Pause::KeyHistory  ; press Pause/Break to pop up the history window

; One Calender
; Ctrl+Shift+/
^+/::
	windowHandleId := WinExist("ahk_pid 8980")
	windowExistsAlready := windowHandleId > 0

	; If the Windows Terminal is already open, determine if we should put it in focus or minimize it.
	if (windowExistsAlready = true)
	{
	activeWindowHandleId := WinExist("A")
	windowIsAlreadyActive := activeWindowHandleId == windowHandleId

		if (windowIsAlreadyActive)
		{
		  ; Minimize the window.
		  TrayTip, WindowActive
		  WinMinimize, "ahk_id %windowHandleId%"
		}
		else
		{
		  ; Put the window in focus.
		  WinActivate, "ahk_id %windowHandleId%"
		  WinShow, "ahk_id %windowHandleId%"
		}
	}
	; Else it's not already open, so launch it.
	else
	{
	Run "C:\Program Files\WindowsApps\64885BlueEdge.OneCalendar_2025.124.1.0_x64__8kea50m9krsh2\CalendarApp.Gui.Win10.exe"
	}
return

; OBSIDIAN
; Ctrl+`
^+`::
	windowHandleId := WinExist("ahk_exe Obsidian.exe")
	windowExistsAlready := windowHandleId > 0

	; If the Windows Terminal is already open, determine if we should put it in focus or minimize it.
	if (windowExistsAlready = true)
	{
	activeWindowHandleId := WinExist("A")
	windowIsAlreadyActive := activeWindowHandleId == windowHandleId

		if (windowIsAlreadyActive)
		{
		  ; Minimize the window.
		  TrayTip, WindowActive
		  WinMinimize, "ahk_id %windowHandleId%"
		}
		else
		{
		  ; Put the window in focus.
		  WinActivate, "ahk_id %windowHandleId%"
		  WinShow, "ahk_id %windowHandleId%"
		  Sleep, 500,
		  Send, ^o
		}
	}
	; Else it's not already open, so launch it.
	else
	{
	Run "C:\Users\azaid\AppData\Local\Programs\obsidian\Obsidian.exe"
	}
return


~Shift & MButton::
    SetTimer, ClickLoop, 10
    return

~MButton Up::
~Shift Up::
    SetTimer, ClickLoop, Off
    return

ClickLoop:
    Click
    return
;~ #InstallKeybdHook
;~ SetCapsLockState, alwaysoff

;~ LControl & Capslock::
	;~ SetCapsLockState, % (State:=!State) ? "on" : "alwaysoff"
;~ Return
;~ ; https://vim.fandom.com/wiki/Map_caps_lock_to_escape_in_Windows
;~ Capslock::
	;~ Send {RAlt Down}
	;~ KeyWait, CapsLock
	;~ Send {RAlt Up}
	;~ if ( A_PriorKey = "CapsLock")
		;~ {
			;~ Send {Esc}
		;~ }
;~ return
;~ ; --------------------||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--------------------

;~ +F1::
;~ if explorerHwnd := WinActive("ahk_class CabinetWClass")
;~ {

    ;~ for window in ComObjCreate("Shell.Application").Windows
    ;~ {
        ;~ if (window.hwnd = explorerHwnd)
            ;~ CurrentExplorerPath := window.Document.Folder.Self.Path
    ;~ }
	;~ MsgBox, %CurrentExplorerPath%
    ;~ Run, pwsh.exe -NoExit -Command "wezterm cli spawn --new-window --cwd $PWD"
;~ }
;~ Return
!n::Send {Down}
!p::Send {Up}
!b::Send {Left}
!f::Send {Right}
;~ #IfWinActive ahk_exe zen.exe
	;~ !n::Send {Down}
	;~ !p::Send {Up}
;~ return

;~ #IfWinActive ahk_exe Microsoft.CmdPal.UI.exe
	;~ ^n::Send {Down}
	;~ ^p::Send {Up}
;~ return

;~ #IfWinActive ahk_exe PowerToys.PowerLauncher.exe
	;~ !n::Send {Down}
	;~ !p::Send {Up}
;~ return

;~ #IfWinActive ahk_exe Obsidian.exe
	;~ !n::Send {Down}
	;~ !p::Send {Up}
;~ return



