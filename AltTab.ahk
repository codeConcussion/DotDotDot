RAlt & l::AltTab
RAlt & j::ShiftAltTab
RAlt & .::Send ^{Tab}
RAlt & m::Send ^+{Tab}

RAlt & a::Aspire()
RAlt & c::FindRun("ahk_exe code.exe", GetEnvironmentVariable("LocalAppData") . "\programs\microsoft vs code\code.exe")
RAlt & k::FindRun("ahk_exe WindowsTerminal.exe", "C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_0.5.2681.0_x64__8wekyb3d8bbwe\WindowsTerminal.exe")
RAlt & i::FindRun("Microsoft Visual Studio", GetEnvironmentVariable("ProgramFiles(x86)") . "\microsoft visual studio\2019\preview\common7\ide\devenv.exe")
RAlt & u::FindRun("Azure Data Studio", GetEnvironmentVariable("LocalAppData") . "\Programs\Azure Data Studio\azuredatastudio.exe")
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
