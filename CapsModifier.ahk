CapsLock & a::return
CapsLock & n::Send ^+-
CapsLock & b::Send ^-
CapsLock & r::Send {F2}
CapsLock & s::Refresh()
CapsLock & q::Send {F10}
CapsLock & w::Send {F11}
CapsLock & e::Send {F12}
CapsLock & /::Send {AppsKey}
CapsLock & j::Left()
CapsLock & l::Right()
CapsLock & i::Up()
CapsLock & k::Down()
CapsLock & u::Home()
CapsLock & o::End()
CapsLock & y::PageUp()
CapsLock & h::PageDown()
CapsLock & t::ControlUp()
CapsLock & g::ControlDown()
CapsLock & m::ControlLeft()
CapsLock & .::ControlRight()
CapsLock & 8::ControlHome()
CapsLock & ,::ControlEnd()
CapsLock & f::Tab()
CapsLock & d::ShiftTab()
CapsLock & `;::Backspace()
CapsLock & '::Delete()
CapsLock & Space::Escape()
CapsLock & Escape::Send ^+{Escape}
CapsLock & x::Cut()
CapsLock & c::Copy()
CapsLock & v::Paste()
CapsLock & 1::Send {F1}
CapsLock & 2::Send {F2}
CapsLock & 3::Send {F3}
CapsLock & 4::Send {F4}
CapsLock & 5::Send {F5}
CapsLock & p::Send -
CapsLock & 9::Send *

Left() {
    if IsKeyDown("LAlt") && IsKeyDown("RShift")
        Send +{Left 8}
    else if IsKeyDown("LAlt")
        Send +{Left}
    else if IsKeyDown("RAlt")
        Send !+{Left}
    else if IsKeyDown("RShift")
        Send {Left 8}
    else if IsKeyDown("A")
        Send 4
    else
        Send {Left}
}

Right() {
    if IsKeyDown("LAlt") && IsKeyDown("RShift")
        Send +{Right 8}
    else if IsKeyDown("LAlt")
        Send +{Right}
    else if IsKeyDown("RAlt")
        Send !+{Right}
    else if IsKeyDown("RShift")
        Send {Right 8}
    else if IsKeyDown("A")
        Send 6
    else
        Send {Right}
}

Up() {
    if IsKeyDown("LAlt") && IsKeyDown("RShift")
        Send +{Up 8}
    else if IsKeyDown("LAlt")
        Send +{Up}
    else if IsKeyDown("RAlt")
        Send !+{Up}
    else if IsKeyDown("RShift")
        Send {Up 8}
    else if IsKeyDown("A")
        Send 8
    else
        Send {Up}
}

Down() {
    if IsKeyDown("LAlt") && IsKeyDown("RShift")
        Send +{Down 8}
    else if IsKeyDown("LAlt")
        Send +{Down}
    else if IsKeyDown("RAlt")
        Send !+{Down}
    else if IsKeyDown("RShift")
        Send {Down 8}
    else if IsKeyDown("A")
        Send 5
    else
        Send {Down}
}

Home() {
    if IsKeyDown("LAlt")
        Send +{Home}
    else if IsKeyDown("RAlt")
        Send !+{Home}
    else if IsKeyDown("A")
        Send 7
    else
        Send {Home}
}

End() {
    if IsKeyDown("LAlt")
        Send +{End}
    else if IsKeyDown("RAlt")
        Send !+{End}
    else if IsKeyDown("A")
        Send 9
    else
        Send {End}
}

PageUp() {
    if IsKeyDown("LAlt")
        Send +{PgUp}
    else if IsKeyDown("RAlt")
        Send !+{PgUp}
    else
        Send {PgUp}
}

PageDown() {
    if IsKeyDown("LAlt")
        Send +{PgDn}
    else if IsKeyDown("RAlt")
        Send !+{PgDn}
    else
        Send {PgDn}
}

ControlUp() {
    if IsKeyDown("LAlt")
        Send ^+{Up}
    else if IsKeyDown("RAlt")
        Send ^!{Up}
    else
        Send ^{Up}
}

ControlDown() {
    if IsKeyDown("LAlt")
        Send ^+{Down}
    else if IsKeyDown("RAlt")
        Send ^!{Down}
    else
        Send ^{Down}
}

ControlLeft() {
    if IsKeyDown("LAlt")
        Send ^+{Left}
    else if IsKeyDown("RAlt")
        Send ^!+{Left}
    else if IsKeyDown("A")
        Send 1
    else
        Send ^{Left}
}

ControlRight() {
    if IsKeyDown("LAlt")
        Send ^+{Right}
    else if IsKeyDown("RAlt")
        Send !^+{Right}
    else if IsKeyDown("A")
        Send 3
    else
        Send ^{Right}
}

ControlHome() {
    if IsKeyDown("LAlt")
        Send ^+{Home}
    else if IsKeyDown("RAlt")
        Send ^!+{Home}
    else if IsKeyDown("A")
        Send /
    else
        Send ^{Home}
}

ControlEnd() {
    if IsKeyDown("LAlt")
        Send ^+{End}
    else if IsKeyDown("RAlt")
        Send ^!+{End}
    else if IsKeyDown("A")
        Send 2
    else
        Send ^{End}
}

Tab() {
    if IsKeyDown("LAlt")
      Send ^{Tab}
    else
      Send {Tab}
}

ShiftTab() {
    if IsKeyDown("LAlt")
      Send ^+{Tab}
    else
      Send +{Tab}
}

Backspace() {
    if IsKeyDown("LAlt")
        Send {Home 2}+{End}{Delete 2}
    else if IsKeyDown("A")
        Send {+}
    else
        Send {Backspace}
}

Delete() {
    if IsKeyDown("LAlt")
        Send +{End}{Delete}
    else if IsKeyDown("LShift")
        Send +{Delete}
    else
        Send {Delete}
}

Escape() {
    if IsKeyDown("A")
        Send 0
    else if IsKeyDown("LAlt")
        Send +{Escape}
    else
        Send {Escape}
}

Cut() {
    if IsKeyDown("LAlt")
        Send {Home 2}+{End}

    Send ^x
}

Copy() {
     if IsKeyDown("LAlt")
        Send {Home 2}+{End}

    Send ^c
}

Paste() {
    if IsKeyDown("LAlt")
        Send {Home 2}+{End}

    Send ^v
}

Refresh() {
    if IsKeyDown("LAlt")
        Send +{F5}
    else
        Send {F5}
}