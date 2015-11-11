#NumpadMult::Send {Media_Play_Pause}
#NumpadDiv::Send {Volume_Mute}
#NumpadAdd::Send {Volume_Up}
#NumpadSub::Send {Volume_Down}
#+NumpadAdd::Send {Media_Next}
#+NumpadSub::Send {Media_Prev}

;#NumpadMult::SendMediaKey("{Media_Play_Pause}")
;#+NumpadAdd::SendMediaKey("{Media_Next}")
;#+NumpadSub::SendMediaKey("{Media_Prev}")
;SendMediaKey(key) {
;    if WinExist("ahk_exe MusicBee.exe") {
;        WinActivate
;        ;Send %key%
;        ;Send !{Escape}
;    }
;}
