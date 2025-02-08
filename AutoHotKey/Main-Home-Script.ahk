#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; alt - ! 
; win - # 
; shift - +
; ctrl - ^

; Morgen
; Ctrl+Shift+/
^+/::
	windowHandleId := WinExist("ahk_exe Morgen.exe")
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
	Run "C:\Users\azaid\AppData\Local\Programs\morgen\Morgen.exe"
	}
return
; OBSIDIAN
; Ctrl+`
^`::
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

; OBSIDIAN
; Ctrl-Alt-V
; ^`::
; if WinExist("ahk_exe Obsidian.exe")
; {
;     WinActivate, ahk_exe Obsidian.exe
;     Sleep, 500 ; wait 0.5 seconds
;     Send, ^o ; send ctrl-o to add a quick note to today's note
; }
; else
; {
;     Run, C:/Users/azaid/AppData/Local/Programs/obsidian/obsidian.exe
;     Sleep, 1500 ; wait 4.5 seconds for Obsidian to launch
;     Send, ^o ; send ctrl-alt-c to add a quick note to today's note
; }
; return
; 



; --------------------||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--------------------

; AUDIO CHANGER
; Win+Ctrl+C
#^c::
    ; Get the list of audio devices and store it in a temporary file
    RunWait, cmd /c "C:\Users\azaid\Documents\Tools\Audio End Point Controller\Release\EndPointController.exe" list > %A_Temp%\audio_devices.txt, , Hide
    if ErrorLevel
    {
        TrayTip, Audio Switcher, Failed to get the list of audio devices., , 1
        return
    }

    ; Read the device list from the temporary file
    FileRead, deviceList, %A_Temp%\audio_devices.txt
    if ErrorLevel
    {
        TrayTip, Audio Switcher, Failed to read the device list., , 1
        return
    }

    ; Count the number of audio devices
    deviceCount := 0
    Loop, Parse, deviceList, `n, `r
    {
        if (A_LoopField != "")
            deviceCount++
    }

    ; Check if there are any audio devices
    if (deviceCount < 1)
    {
        TrayTip, Audio Switcher, No audio devices found., , 1
        return
    }

    ; Toggle between the audio devices
    currentDeviceIndex := (currentDeviceIndex ? currentDeviceIndex : 0) + 1
    if (currentDeviceIndex > deviceCount)
    {
        currentDeviceIndex := 1
    }
    
    ; Switch to the next device by index
    Run, "C:\Users\azaid\Documents\Tools\Audio End Point Controller\Release\EndPointController.exe" %currentDeviceIndex%, , UseErrorLevel
    if ErrorLevel
    {
        TrayTip, Audio Switcher, Failed to switch audio device., , 1
    }
    ;else
    ;{
    ;    TrayTip, Audio Switcher, Switched to Device Index: %currentDeviceIndex%, , 1
    ;}
return

; --------------------||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--------------------

; Open windows terminal
!`::
	windowHandleId := WinExist("ahk_exe wezterm-gui.exe")
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
	Run "C:\Program Files\WezTerm\wezterm-gui.exe"
	}
return

; --------------------||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--------------------


#InstallKeybdHook
SetCapsLockState, alwaysoff
Capslock::
    Send {LControl Down}
    KeyWait, CapsLock
    Send {LControl Up}
    if ( A_PriorKey = "CapsLock" )
    {
        Send {Esc}
    }
return

; --------------------||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--------------------

; Adobe navigation

scrollAmount := 20
#IfWinActive ahk_class AcrobatSDIWindow
h::Send {Left}
Return

#IfWinActive ahk_class AcrobatSDIWindow
j::Send {Down}
Return

#IfWinActive ahk_class AcrobatSDIWindow
k::Send {Up}
Return

#IfWinActive ahk_class AcrobatSDIWindow
l::Send {Right}
Return

#IfWinActive ahk_class AcrobatSDIWindow
!j::Send {WheelDown %scrollAmount%}
Return

#IfWinActive ahk_class AcrobatSDIWindow
!k::Send {WheelUp %scrollAmount%}
Return


; --------------------||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--------------------



#IfWinActive ahk_exe PowerToys.PowerLauncher.exe
^j::Send {Down}
return

#IfWinActive ahk_exe PowerToys.PowerLauncher.exe
^k::Send {Up}
return


#IfWinActive ahk_exe Obsidian.exe
^j::Send {Down}
return

#IfWinActive ahk_exe Obsidian.exe
^k::Send {Up}
return


#IfWinActive ahk_exe Morgen.exe
^WheelUp::Send {Right}
return

#IfWinActive ahk_exe Morgen.exe
^WheelDown::Send {Left}
return

