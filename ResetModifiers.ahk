*Pause::ResetModifiers()    ;trying to fix the annoying bug where a modifier key gets "stuck" down

ResetModifiers() {
    Send {Ctrl up}
    Send {LCtrl up}
    Send {RCtrl up}

    Send {Alt up}
    Send {LAlt up}
    Send {RAlt up}

    Send {Shift up}
    Send {LShift up}
    Send {RShift up}

    Send {Win up}
    Send {LWin up}
    Send {RWin up}
}