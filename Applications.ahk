#t::Send ^t
#,::Run % GetEnvironmentVariable("ProgramFiles(x86)") . "\microsoft office\root\office16\excel.exe /e"
#.::Run % GetEnvironmentVariable("ProgramFiles(x86)") . "\microsoft office\root\office16\winword.exe /q"
#/::Run % GetEnvironmentVariable("ProgramFiles(x86)") . "\microsoft office\root\office16\outlook.exe /recycle"
#'::Run % GetEnvironmentVariable("DropBox") . "\apps\beyond compare 3\bcompare.exe"
;#]::Run % GetEnvironmentVariable("DropBox") . "\apps\sublime\sublime_text.exe"
#]::Run % GetEnvironmentVariable("ProgramFiles") . "\microsoft vs code\code.exe"
#[::Run % GetEnvironmentVariable("DropBox") . "\apps\notepad2\notepad2.exe"
;#[::Run % GetEnvironmentVariable("SystemRoot") . "\notepad.exe"
#+\::SendTo(1)
#+,::SendTo(1)
#+]::SendTo(2)
#+c::SendTo(2)
#+[::SendTo(3)
#+'::SendTo(4)
#=::Send #+=
#-::Send #+-

;aspire
#IfWinActive ahk_exe LeaseTeam.Client.exe
    ^w::Send ^{F4}
    ^p::^q
#IfWinActive

;linqpad
#IfWinActive LINQPad
    ^w::Send ^{F4}
#IfWinActive

;management studio
#IfWinActive Microsoft SQL Server Management Studio
    F4::return
    F10::return
    F11::return
    ^w::Send ^{F4}
    +!l::Send {F8}
    !Enter::Send, {AppsKey}y
#IfWinActive

;beyond compare
#IfWinActive ahk_class TViewForm.UnicodeClass
    ^i::^p
    ^k::^n
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
