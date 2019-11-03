#SingleInstance, Force
#EscapeChar \
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetNumLockState AlwaysOff

Caps := 0
QuitConfirm := 0

OSD("Magic Caps Started", 3000)

*CapsLock::
CapsLock::
if (Caps = 0) {
	showCapsBar()
}
Caps := 1
return

*CapsLock up::
CapsLock up::
OSD()
Caps := 0
QuitConfirm := 0
return

; !h::Left
; !j::Down
; !k::Up
; !l::Right

#if Caps

w::Up
a::Left
s::Down
d::Right

i::Up
j::Left
k::Down
l::Right
\;::Enter

; bracket helpers
+9::Send, (){Left}
[::Send, []{Left}
+[::Send, {{}{}}{Left}
'::Send, ''{Left}
+'::Send, ""{Left}

; down Ctrl
^+9::Send, ^x(){Left}^v
^[::Send, ^x[]{Left}^v
^+[::Send, ^x{{}{}}{Left}^v
^'::Send, ^x''{Left}^v
^+'::Send, ^x""{Left}^v

n::WinMinimize, A

`::
newLockState := (GetKeyState("CapsLock", "T") ? "off" : "on")
SetCapsLockState, %newLockState%
showCapsBar()
return

; c up::Run, cmd.exe
c::LCtrl

p::
OSD("Hey! Don't hit me!")
return

q::
if (QuitConfirm) {
	ExitApp, 0
}
QuitConfirm := 1
quit_notif =
(
Hit [Q] again
to stop the script
)
OSD(quit_notif)
return

r::
Reload
return

#if ; Caps


OSD(text="", time=0)
{
	if (!text) {
		Progress, Off
		return
	}
	#Persistent
	Progress, Y680 X100 W180 b zh0 cw000000 fm12 CTFFFFFF,, %text%, AutoHotKeyProgressBar, Segoe UI
	WinSet, Transparent, 200
	Progress, show
	if (time > 0) {
		SetTimer, RemoveToolTip, %time%
	}

	Return


RemoveToolTip:
	SetTimer, RemoveToolTip, Off
	Progress, Off
	return
}


showCapsBar()
{
	OSD("Magic Caps" . (GetKeyState("CapsLock", "T") ? "\n(Caps ON)" : ""))
}