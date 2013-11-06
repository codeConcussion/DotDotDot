^F1::Send {F1}
*F1::return
#t::Send ^t
#,::Run % GetEnvironmentVariable("ProgramFiles") . "\microsoft office\office15\excel.exe /e"
#.::Run % GetEnvironmentVariable("ProgramFiles") . "\microsoft office\office15\winword.exe /q"
#/::Run % GetEnvironmentVariable("ProgramFiles") . "\microsoft office\office15\outlook.exe /recycle"
#'::Run % GetEnvironmentVariable("DropBox") . "\apps\beyond compare 3\bcompare.exe"
#\::Run % GetEnvironmentVariable("DropBox") . "\apps\sublime\sublime_text.exe"
#]::Run % GetEnvironmentVariable("DropBox") . "\apps\notepad2\notepad2.exe"
#[::Run % GetEnvironmentVariable("SystemRoot") . "\notepad.exe"
#+\::SendTo(1)
#+,::SendTo(1)
#+]::SendTo(2)
#+[::SendTo(3)
#+'::SendTo(4)
#=::Send #+=
#-::Send #+-
#NumpadMult::Send {Media_Play_Pause}
#NumpadDiv::Send {Volume_Mute}
#NumpadAdd::Send {Volume_Up}
#NumpadSub::Send {Volume_Down}
#+NumpadAdd::Send {Media_Next}
#+NumpadSub::Send {Media_Prev}

;chrome
#IfWinActive ahk_class Chrome_WidgetWin_0
    ^i::^f
#IfWinActive

;management studio
#IfWinActive Microsoft SQL Server Management Studio
    F4::return
    F10::return
    F11::return
    ^w::^F4
    +!l::Send {F8}
    !Enter::Send, {AppsKey}y
#IfWinActive

;linqpad
#IfWinActive LINQPad 4
    ^w::^F4
#IfWinActive

;beyond compare
#IfWinActive ahk_class TViewForm.UnicodeClass
    ^i::^p
    ^k::^n
#IfWinActive

;aspire
#IfWinActive ASPIRE
    ^w::^F4
    ^p::^q
#IfWinActive

GetEnvironmentVariable(environmentVariable) {
    EnvGet, value, %environmentVariable%
    return %value%
}

RunActivate(executable, title) {
    Run, %executable%
    WinWait, %title%
    WinActivate, %title%
}

SendTo(number) {
    Send {AppsKey}
    Sleep 250
    Send n%number%
}