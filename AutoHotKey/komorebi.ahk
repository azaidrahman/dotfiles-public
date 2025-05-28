#Requires AutoHotkey v2.0.19
#SingleInstance Force

; === SYMBOLS ===
; !   <- Alt
; +   <- Shift
; ^   <- Ctrl
; #   <- Win

; Adapted from https://github.com/ConnorSweeneyDev/.config/blob/main/ahk/wm.ahk
#e::Run("explorer")
#t::Run("pwsh -NoProfile -Command wezterm", , "Hide")
; #f::Run("pwsh -NoProfile -Command firefox", , "Hide")
#f::Run("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Zen.lnk")
#d::Run("C:\Users\azaid\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Obsidian.lnk")

; #s::Run("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Steam.lnk")

RunWait("pwsh -NoProfile -Command if ((Get-Process -Name 'komorebi' -ErrorAction SilentlyContinue) -eq $null) { } else { komorebic stop }", , "Hide")
RunWait("pwsh -Command komorebic start", , "Hide")

Komorebic(cmd) {
    RunWait(format("komorebic.exe {}", cmd), , "Hide")
}

;~ !q::Komorebic("close")
!x::Komorebic("close")
;~ !m::Komorebic("minimize")

; Focus windows
!h::Komorebic("focus left")
!j::Komorebic("focus down")
!k::Komorebic("focus up")
!l::Komorebic("focus right")

+!^-::Komorebic("cycle-layout previous")
+!^+::Komorebic("cycle-layout next")

; Move windows
!+h::Komorebic("move left")
!+j::Komorebic("move down")
!+k::Komorebic("move up")
!+l::Komorebic("move right")

; Stack windows
!Left::Komorebic("stack left")
!Down::Komorebic("stack down")
!Up::Komorebic("stack up")
!Right::Komorebic("stack right")
!;::Komorebic("unstack")
!,::Komorebic("cycle-stack previous")
!.::Komorebic("cycle-stack next")

; Resize
!=::Komorebic("resize-axis horizontal increase")
!-::Komorebic("resize-axis horizontal decrease")
!+=::Komorebic("resize-axis vertical increase")
!+_::Komorebic("resize-axis vertical decrease")

; Manipulate windows
;~ !+t::Komorebic("toggle-float")
!d::Komorebic("toggle-float")
!m::Komorebic("toggle-monocle")

; Window manager options
!0::Komorebic("retile")
!+p::Komorebic("toggle-pause")

; Layouts
;~ !+x::Komorebic("flip-layout horizontal")
;~ !+y::Komorebic("flip-layout vertical")

; Cycle Workspace
;~ !a::Komorebic("cycle-workspace previous")
;~ !s::Komorebic("cycle-workspace next")


; Workspaces
!1::Komorebic("focus-workspace 0")
!2::Komorebic("focus-workspace 1")
!3::Komorebic("focus-workspace 2")
!4::Komorebic("focus-workspace 3")
!5::Komorebic("focus-workspace 4")
!6::Komorebic("focus-workspace 5")
!7::Komorebic("focus-workspace 6")
!8::Komorebic("focus-workspace 7")
!9::Komorebic("focus-workspace 8")



; Move windows across workspaces
!+1::Komorebic("move-to-workspace 0")
!+2::Komorebic("move-to-workspace 1")
!+3::Komorebic("move-to-workspace 2")
!+4::Komorebic("move-to-workspace 3")
!+5::Komorebic("move-to-workspace 4")
!+6::Komorebic("move-to-workspace 5")
!+7::Komorebic("move-to-workspace 6")
!+8::Komorebic("move-to-workspace 7")
!+9::Komorebic("move-to-workspace 8")


RunWait("pwsh -NoProfile -Command if ((Get-Process -Name 'yasb' -ErrorAction SilentlyContinue) -eq $null) { } else { yasbc stop }", , "Hide")
RunWait("pwsh -NoProfile -Command yasbc start", , "Hide")
OpenYasbMenu() {
  ButtonOffsetX := 20
  ButtonOffsetY := 20
  MonitorPrimary := MonitorGetPrimary()
  MonitorGet MonitorPrimary, &L, &T, &R, &B
  DllCall("SetCursorPos", "int", (L + ButtonOffsetX), "int", (T + ButtonOffsetY))
  MouseClick "Left"
  DllCall("SetCursorPos", "int", R / 2, "int", B / 2)
}
;~ ^!BS::OpenYasbMenu()
