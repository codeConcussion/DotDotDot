RAlt & l::AltTab
RAlt & j::ShiftAltTab
RAlt & .::Send ^{Tab}
RAlt & m::Send ^+{Tab}

RAlt & a::Aspire()
RAlt & k::FindRun("ahk_class VirtualConsoleClass", GetEnvironmentVariable("DropBox") . "\apps\conemu\conemu64.exe")
RAlt & i::FindRun("Microsoft Visual Studio", GetEnvironmentVariable("ProgramFiles(x86)") . "\microsoft visual studio 11.0\common7\ide\devenv.exe")
RAlt & ,::FindRun("Sublime Text 2", GetEnvironmentVariable("Dropbox") . "\apps\sublime\sublime_text.exe")
RAlt & u::FindRun("Microsoft SQL Server Management Studio", GetEnvironmentVariable("ProgramFiles(x86)") . "\microsoft sql server\110\tools\binn\managementstudio\ssms.exe")
RAlt & o::FindRun("LINQPad", GetEnvironmentVariable("Dropbox") . "\apps\linqpad\linqpad.exe")

FindRun(find, launch) {
    if WinExist(find) {
        WinActivate
    }
    else {
        Run *RunAs %launch%
    }
}

Aspire() {
    if WinExist("ASPIRE") {
        WinActivate
    }
    else {
        Run % "d:\dev\aspire\client\bin\debug\leaseTeam.client.exe"
        WinWait, Sign in to ASPIRE
        WinActivate        
    }

    if WinActive("Sign in to ASPIRE") {
        Send b{Enter}
    }
}