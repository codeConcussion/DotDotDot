;windows 10 robbed my window management!

_positionHome := 1
_positionLeft := 2
_positionTop := 3
_positionRight := 4
_positionBottom := 5
_positionTopLeft := 6
_positionTopRight := 7
_positionBottomRight := 8
_positionBottomLeft := 9
_positionCount := 9
_padding := 1
_undoId := ""
_undoPositions := ""

StartUp()

#Left::Move()
#Up::Move()
#Right::Move()
#Down::Move()
#Home::Move()
#End::MoveToPreviousMonitor()
#PgDn::MoveToNextMonitor()
#PgUp::MaximizeRestore()
#Insert::SetOnTop()
#Delete::RemoveOnTop()
#Backspace::UndoMove()
#a::MaximizeRestore()
#z::Minimize()
#q::Close()
#w::CloseTab()

Move() {
    global
    local isLeft := IsKeyDown("Left") || IsKeyDown("J")
    local isUp := IsKeyDown("Up") || IsKeyDown("I")
    local isRight := IsKeyDown("Right") || IsKeyDown("L")
    local isDown := IsKeyDown("Down") || IsKeyDown("K")

    if isLeft && isUp && isRight && isDown {
        InitializePositions()
        return
    }

    if isLeft {
        if isUp {
            position := _positionTopLeft
        }
        else if isDown {
            position := _positionBottomLeft
        }
        else if isRight {
            position := _positionHome
        }
        else {
            position := _positionLeft
        }
    }
    else if isRight {
        if isUp {
            position := _positionTopRight
        }
        else if isDown {
            position := _positionBottomRight
        }
        else {
            position := _positionRight
        }
    }
    else if isUp {
        if isDown {
            position := _positionHome
        }
        else {
            position := _positionTop
        }
    }
    else if isDown {
        position := _positionBottom
    }
    else {
        position := _positionHome
    }

    local monitor := GetCurrentMonitor()
    local location := _position%monitor%_%position%
    StoreUndoLocation()
    MoveToLocation(location)
}

MoveToLocation(location) {
    if (IsMaximized()) {
        Restore()
    }

    StringSplit, parts, location, `,
    WinMove, A,, %parts1%, %parts2%, %parts3%, %parts4%
}

MoveToNextMonitor() {
    MoveToAdjacentMonitor(1)
}

MoveToPreviousMonitor() {
    MoveToAdjacentMonitor(-1)
}

MoveToAdjacentMonitor(relationToCurrent) {
    global

    local current := GetCurrentMonitor()
    local adjacent := GetAdjacentMonitor(relationToCurrent)

    if (current != adjacent) {
        if (IsMaximized()) {
            ;use the built-in windows hotkey for maximized windows
            if (relationToCurrent > 0)
                Send #+{Right}
            else
                Send #+{Left}
        }
        else {
            local position := GetCurrentPositionIndex()
            local location := position > 0 ? _position%adjacent%_%position% : GetAdjacentPosition(relationToCurrent)
            MoveToLocation(location)
        }
    }
}

UndoMove() {
    global
    local id := WinExist("A")
    local undo := _undo%id%

    if (undo != "") {
        MoveToLocation(undo)
    }
}

MaximizeRestore() {
    if (IsMaximized()) {
        Restore()
    }
    else {
        Maximize()
    }
}

Maximize() {
    WinMaximize, A
}

Minimize() {
    WinMinimize, A
}

Restore() {
    WinRestore, A
}

Close() {
    WinClose, A
}

CloseTab() {
    Send ^w
}

SetOnTop() {
    WinSet, AlwaysOnTop, On, A
    WinGetTitle, title, A
    WinSetTitle, A, , ::%title%::
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

IsMaximized() {
    WinGet, maximized, MinMax, A
    return %maximized%
}

IsKeyDown(key) {
    return GetKeyState(key, "P")
}

GetMonitorDimensions(monitor) {
    SysGet, dimension, MonitorWorkArea, %monitor%
    dimensions = %dimensionLeft%,%dimensionRight%,%dimensionTop%,%dimensionBottom%
    return %dimensions%
}

GetMonitorDimension(monitor, dimension) {
    global

    local parts
    StringSplit, parts, _monitor%monitor%, `,

    local value := parts%dimension%
    return %value%
}

GetMonitorCount() {
    SysGet, count, MonitorCount
    return %count%
}

GetCurrentMonitor() {
    WinGetPos, x, y, width, height, A
    x += Floor(width / 2)
    y += Floor(height / 2)
    return GetMonitorAt(x, y)
}

GetAdjacentMonitor(relationToCurrent) {
    count := GetMonitorCount()
    current := GetCurrentMonitor()
    adjacent := current + relationToCurrent

    if (adjacent > count) {
        return 1
    }
    else if (adjacent < 1) {
        return count
    }
    else {
        return %adjacent%
    }
}

GetMonitorAt(x, y) {
    count := GetMonitorCount()

    Loop, %count% {
        SysGet, monitor, Monitor, %A_Index%

        if (x >= monitorLeft && x <= monitorRight && y >= monitorTop && y <= monitorBottom) {
            return %A_Index%
        }
    }

    return 1
}

GetWidth(monitor) {
    left := GetLeft(monitor)
    right := GetRight(monitor)
    width := right - left
    return %width%
}

GetHeight(monitor) {
    top := GetMonitorDimension(monitor, 3)
    bottom := GetMonitorDimension(monitor, 4)
    height := bottom - top
    return %height%
}

GetLeft(monitor) {
    left := GetMonitorDimension(monitor, 1)
    return %left%
}

GetRight(monitor) {
    right := GetMonitorDimension(monitor, 2)
    return %right%
}

GetTop(monitor) {
    top := GetMonitorDimension(monitor, 3)
    return %top%
}

GetBottom(monitor) {
    bottom := GetMonitorDimension(monitor, 4)
    return %bottom%
}

GetCurrentPositionIndex() {
    global

    local positionIndex := 0
    local monitor := GetCurrentMonitor()
    local position := GetCurrentPosition()

    Loop %_positionCount% {
        if (position == _position%monitor%_%A_Index%) {
            return %A_Index%
        }
    }

    return 0
}

GetCurrentPosition() {
    WinGetPos, left, top, width, height, A
    position = %left%,%top%,%width%,%height%
    return %position%
}

GetAdjacentPosition(relationToCurrent) {
    WinGetPos, left, top, width, height, A

    current := GetCurrentMonitor()
    adjacent := GetAdjacentMonitor(relationToCurrent)

    leftRatio := (left - GetLeft(current)) / GetWidth(current)
    topRatio := (top - GetTop(current)) / GetHeight(current)
    widthRatio := width / GetWidth(current)
    heightRatio := height / GetHeight(current)

    left := GetLeft(adjacent) + Floor(GetWidth(adjacent) * leftRatio)
    top := GetTop(adjacent) + Floor(GetHeight(adjacent) * topRatio)
    width := Floor(GetWidth(adjacent) * widthRatio)
    height := Floor(GetHeight(adjacent) * heightRatio)

    position = %left%,%top%,%width%,%height%
    return %position%
}

CreateHomePosition(monitor) {
    global _padding

    fullWidth := GetWidth(monitor)
    fullHeight := GetHeight(monitor)

    width := Floor(fullWidth * .9)
    height := Floor(fullHeight * .9)

    left := Floor(GetLeft(monitor) + (fullWidth * .05))
    top := Floor(GetTop(monitor) + (fullHeight * .05))

    position = %left%,%top%,%width%,%height%
    return position
}

CreateLeftPosition(monitor) {
    global _padding

    fullWidth := GetWidth(monitor)
    fullHeight := GetHeight(monitor)

    width := Floor(fullWidth / 2 - (_padding * 2))
    height := Floor(fullHeight - (_padding * 2))

    left := Floor(GetLeft(monitor) + _padding)
    top := Floor(GetTop(monitor) + _padding)

    position = %left%,%top%,%width%,%height%
    return position
}

CreateTopPosition(monitor) {
    global _padding

    fullWidth := GetWidth(monitor)
    fullHeight := GetHeight(monitor)

    width := Floor(fullWidth - (_padding * 2))
    height := Floor(fullHeight / 2 - (_padding * 2))

    left := Floor(GetLeft(monitor) + _padding)
    top := Floor(GetTop(monitor) + _padding)

    position = %left%,%top%,%width%,%height%
    return position
}

CreateRightPosition(monitor) {
    global _padding

    fullWidth := GetWidth(monitor)
    fullHeight := GetHeight(monitor)

    width := Floor(fullWidth / 2 - (_padding * 2))
    height := Floor(fullHeight - (_padding * 2))

    left := Floor(GetLeft(monitor) + (fullWidth / 2) + _padding)
    top := Floor(GetTop(monitor) + _padding)

    position = %left%,%top%,%width%,%height%
    return position
}

CreateBottomPosition(monitor) {
    global _padding

    fullWidth := GetWidth(monitor)
    fullHeight := GetHeight(monitor)

    width := Floor(fullWidth - (_padding * 2))
    height := Floor(fullHeight / 2 - (_padding * 2))

    left := Floor(GetLeft(monitor) + _padding)
    top := Floor(GetTop(monitor) + (fullHeight / 2) + _padding)

    position = %left%,%top%,%width%,%height%
    return position
}

CreateTopLeftPosition(monitor) {
    global _padding

    fullWidth := GetWidth(monitor)
    fullHeight := GetHeight(monitor)

    width := Floor(fullWidth / 2 - (_padding * 2))
    height := Floor(fullHeight / 2 - (_padding * 2))

    left := Floor(GetLeft(monitor) + _padding)
    top := Floor(GetTop(monitor) + _padding)

    position = %left%,%top%,%width%,%height%
    return position
}

CreateTopRightPosition(monitor) {
    global _padding

    fullWidth := GetWidth(monitor)
    fullHeight := GetHeight(monitor)

    width := Floor(fullWidth / 2 - (_padding * 2))
    height := Floor(fullHeight / 2 - (_padding * 2))

    left := Floor(GetLeft(monitor) + (fullWidth / 2) + _padding)
    top := Floor(GetTop(monitor) + _padding)

    position = %left%,%top%,%width%,%height%
    return position
}

CreateBottomRightPosition(monitor) {
    global _padding

    fullWidth := GetWidth(monitor)
    fullHeight := GetHeight(monitor)

    width := Floor(fullWidth / 2 - (_padding * 2))
    height := Floor(fullHeight / 2 - (_padding * 2))

    left := Floor(GetLeft(monitor) + (fullWidth / 2) + _padding)
    top := Floor(GetTop(monitor) + (fullHeight / 2) + _padding)

    position = %left%,%top%,%width%,%height%
    return position
}

CreateBottomLeftPosition(monitor) {
    global _padding

    fullWidth := GetWidth(monitor)
    fullHeight := GetHeight(monitor)

    width := Floor(fullWidth / 2 - (_padding * 2))
    height := Floor(fullHeight / 2 - (_padding * 2))

    left := Floor(GetLeft(monitor) + _padding)
    top := Floor(GetTop(monitor) + (fullHeight / 2) + _padding)

    position = %left%,%top%,%width%,%height%
    return position
}

StoreUndoLocation() {
    global

    if (!GetCurrentPositionIndex()) {
        local id := WinExist("A")
        _undo%id% := GetCurrentPosition()

        if (!InStr(_undoIds, id)) {
            _undoIds .= id . ","
        }
    }
}

PeriodicCleanUp() {
    global _undoIds
    StringSplit, parts, _undoIds, `,
    _undoIds := ""

    Loop %parts0% {
        id := parts%A_Index%
        find := "ahk_id " . id

        if (WinExist(find)) {
            _undoIds .= id . ","
        }
        else if (id != "") {
            VarSetCapacity(_undo%id%, 0)
        }
    }
}
