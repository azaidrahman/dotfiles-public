; --------------------||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--------------------

; Play MPV from youtube
; Windows+Shift+W
+#w:: ; Windows+Shift+W as the hotkey
    If WinActive("ahk_class MozillaWindowClass") or WinActive("ahk_exe msedge.exe")
    {
        Send, ^l ; Focuses the address bar in Firefox and Edge
        Send, ^c ; Copies the URL
        ClipWait, 1 ; Waits for 1 second for the clipboard to contain text
        if ErrorLevel ; If ClipWait times out
        {
            ToolTip, "Clipboard copy failed. Check if browser's address bar is accessible."
            SetTimer, RemoveToolTip, 3000 ; Tooltip displays for 3 seconds
            return
        }
        Run, mpvnet.exe %clipboard%, , UseErrorLevel ; Opens the URL in MPV.net with error checking
        if ErrorLevel ; If Run encounters an error
        {
            ToolTip, "Failed to open MPV.net. Check if mpvnet.exe is correctly installed and accessible."
            SetTimer, RemoveToolTip, 3000 ; Tooltip displays for 3 seconds
        }
        else
        {
            ToolTip, "URL opened in MPV.net successfully!"
            SetTimer, RemoveToolTip, 3000 ; Tooltip displays for 3 seconds
        }
    }
    else
    {
        ToolTip, "Script active only in Mozilla Firefox or Microsoft Edge."
        SetTimer, RemoveToolTip, 3000 ; Tooltip displays for 3 seconds
    }
    return
