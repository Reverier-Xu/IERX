import QtQuick 2.15
import "."

Rectangle {
    id: root
    property bool flat: false
    property color normalColor: flat ? "transparent" : Style.activeColor1
    property color hoverColor: Style.activeColor2
    property color pressedColor: Style.activeColorDimmed
    property color disabledColor: Style.disabledColor
    property color borderColor: flat ? "transparent" : Style.activeColor3
    property color borderDisabledColor: Style.disabledColor

    color: normalColor
    border.width: 0
    border.color: enabled ? borderColor : borderDisabledColor
    radius: 0

    signal clicked(var mouse)
    signal doubleClicked(var mouse)

    MouseArea {
        id: mouseArea_
        anchors.fill: parent
        hoverEnabled: true
        enabled: root.enabled
        property bool pressed: false
        property bool hovered: false

        onClicked: root.clicked(mouse)
        onDoubleClicked: root.doubleClicked(mouse)
        onEntered: {
            if (!pressed) {
                parent.state="Hovering"
            }
            hovered = true
        }
        onExited: {
            if (!pressed) {
                parent.state = "Normal"
            }
            hovered = false
        }
        onPressed: {
            parent.state="Pressed"
            pressed = true
        }
        onReleased: {
            if (containsMouse) {
                parent.state="Hovering"
            } else {
                parent.state = "Normal"
            }
            pressed = false
        }
    }

    states: [
        State {
            name: "Hovering"
            PropertyChanges {
                target: root
                color: hoverColor
            }
            PropertyChanges {
                target: root
                border.width: 1
            }
        },
        State {
            name: "Normal"
            PropertyChanges {
                target: root
                color: normalColor
            }
            PropertyChanges {
                target: root
                border.width: 0
            }
        },
        State {
            name: "Disabled"
            PropertyChanges {
                target: root
                color: disabledColor
            }
            PropertyChanges {
                target: root
                border.width: 0
            }
        },
        State {
            name: "Pressed"
            PropertyChanges {
                target: root
                color: pressedColor
            }
            PropertyChanges {
                target: root
                border.width: 1
            }
        }
    ]

    Behavior on color {
        ColorAnimation {
            duration: 120
        }
    }
}
