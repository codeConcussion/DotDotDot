*Pause::ResetModifiers()    ;trying to fix the annoying bug where a modifier key gets "stuck" down

;solution copied from https://autohotkey.com/board/topic/94091-sometimes-modifyer-keys-always-down/
ResetModifiers() {
    static allModifiers := ["Ctrl", "LCtrl", "RCtrl", "Alt", "LAlt", "RAlt", "Shift", "LShift", "RShift", "LWin", "RWin"]
    local startTime := A_Tickcount

    while (IsAnyKeyDown(allModifiers))
    {
        if (A_Tickcount - startTime >= 2000) {
            Reload
            return 1
        }

        Sleep 5
    }

    return
}

IsAnyKeyDown(keys) {
    if IsObject(keys) {
        for Index, key in keys {
            if GetKeyState(key, "P") {
                return key
            }
        }
    }
    else if GetKeyState(keys, "P") {
        return keys
    }

    return 0
}