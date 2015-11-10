#q::Close()
#Insert::SetOnTop()
#Delete::RemoveOnTop()
#End::MoveToPreviousMonitor()
#PgDn::MoveToNextMonitor()
#PgUp::MaximizeRestore()

Close() {
    WinClose, A
}

IsMaximized() {
    WinGet, maximized, MinMax, A
    return %maximized%
}

RemoveOnTop() {
    WinSet, AlwaysOnTop, Off, A
    WinGetTitle, title, A

    StringLeft, marker, title, 2
    if (marker = "::") {
        StringTrimLeft, title, title, 2
    }

    StringRight, marker, title, 2
    if (marker = "::") {
        StringTrimRight, title, title, 2
    }

    WinSetTitle, A, , %title%
}

Maximize() {
    WinMaximize, A
}

MaximizeRestore() {
    if (IsMaximized()) {
        Restore()
    }
    else {
        Maximize()
    }
}

MoveToNextMonitor() {
    Send #+{Right}
}

MoveToPreviousMonitor() {
    Send #+{Left}
}

Restore() {
    WinRestore, A
}

SetOnTop() {
    WinSet, AlwaysOnTop, On, A
    WinGetTitle, title, A
    WinSetTitle, A, , ::%title%::
}
