import QtQuick 6.3
import QtQuick.Controls 6.3
import QtQuick.Controls.Universal 6.3
import "."

Button {
    id: root
    background: Rectangle {
        opacity: enabled ? 1 : 0.3
        border.width: 1
        border.color: (root.down && root.hovered && !root.flat) ? Style.activeColor3 : "transparent"
        color: !root.down && !root.hovered && root.flat ? "transparent" : (!root.down && root.hovered ? Style.activeColor2 : Style.activeColor1)
        Behavior on color { ColorAnimation { duration: Style.microAnimDuration } }
    }
}
