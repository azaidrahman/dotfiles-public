; --------------------||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--------------------

; Chinese-Related scripts

;Upload to MDBG (Dictionary)
; Ctrl+Alt+D
^!d::
    ; Copy the highlighted text to the clipboard
    Send, ^c
    ; Small delay to ensure clipboard is updated
    Sleep, 50
    ; Run the PowerShell script
    Run, powershell.exe -NoProfile -ExecutionPolicy Bypass -File "C:\Users\azaid\iCloudDrive\Personal\Programming\Powershell\uploadToMDBG.ps1"
return

; Upload to AI Translator
; Ctrl+Alt+F
^!f::
    ; Copy the highlighted text to the clipboard
    Send, ^c
    ; Small delay to ensure clipboard is updated
    Sleep, 50
    ; Run the PowerShell script
    Run, powershell.exe -NoProfile -ExecutionPolicy Bypass -File "C:\Users\azaid\iCloudDrive\Personal\Programming\Powershell\uploadToDEEPL.ps1"
return

; Convert text to ruby format -> Add to Clipboard
; Ctrl+Alt+R
^!r::
    ; Copy the highlighted text to the clipboard
    Send, ^c
    ; Small delay to ensure clipboard is updated
    Sleep, 50
    ; Run the Python script, assume Python is in the PATH and the script is named convert_to_ruby.py
    Run, "C:\Users\azaid\iCloudDrive\Personal\Programming\Python Scripts\Hanzi to Ruby\venv\Scripts\python.exe" "C:\Users\azaid\iCloudDrive\Personal\Programming\Python Scripts\Hanzi to Ruby\hanzi to ruby.py", , Hide
    ; Optional: Display a notification to indicate the operation is done
    TrayTip, Ruby Conversion, The text has been converted to Ruby format and copied to the clipboard., 3
return
	