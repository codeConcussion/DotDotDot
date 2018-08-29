RAlt & l::AltTab
RAlt & j::ShiftAltTab
RAlt & .::Send ^{Tab}
RAlt & m::Send ^+{Tab}

RAlt & a::Aspire()
RAlt & c::FindRun("ahk_exe code.exe", GetEnvironmentVariable("LocalAppData") . "\programs\microsoft vs code\code.exe")
RAlt & k::FindRun("ahk_class VirtualConsoleClass", GetEnvironmentVariable("DropBox") . "\apps\conemu\conemu64.exe")
RAlt & i::FindRun("Microsoft Visual Studio", GetEnvironmentVariable("ProgramFiles(x86)") . "\microsoft visual studio\2017\enterprise\common7\ide\devenv.exe")
RAlt & u::FindRun("Microsoft SQL Server Management Studio", GetEnvironmentVariable("ProgramFiles(x86)") . "\microsoft sql server\140\tools\binn\managementstudio\ssms.exe")
RAlt & o::FindRun("LINQPad", GetEnvironmentVariable("Dropbox") . "\apps\linqpad\linqpad.exe")
RAlt & ,::FindRun("ahk_exe chrome.exe", GetEnvironmentVariable("ProgramFiles(x86)") . "\google\chrome\application\chrome.exe")

FindRun(find, launch) {
    if WinExist(find) {
        WinActivate
    }
    else {
        Run *RunAs %launch%
    }
}

Aspire() {
    if WinExist("ahk_exe leaseteam.client.exe") {
        WinActivate
    }
    else {
        Run % "c:\dev\aspire\client\bin\debug\leaseteam.client.exe"
        WinWait, Sign in to ASPIRE
        WinActivate
    }

    if WinActive("Sign in to ASPIRE") {
        Send !u
        Send admin

        Send !p
        Send b{Enter}
    }
}
