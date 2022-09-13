import QtQuick 6.3
import QtQuick.Controls 6.3
import QtQuick.Controls.Universal 6.3
import "."

Menu {
    id: root
    padding: 1
    opacity: visible ? 1 : 0
    Behavior on opacity {
        NumberAnimation {
            duration: Style.microAnimDuration
        }
    }

    scale: visible ? 1 : 0.95
    Behavior on scale {
        NumberAnimation {
            duration: Style.midAnimDuration
            easing.type: Easing.OutExpo
        }
    }

    delegate: MenuItem {
        id: menuItem
        implicitWidth: 200
        implicitHeight: 32

        arrow: Image {
            x: menuItem.width - 32
            y: menuItem.height / 2 - height / 2
            width: 16
            height: 16
            visible: menuItem.subMenu
            source: menuItem.highlighted ? "qrc:/assets/chevron-double-right.svg" : "qrc:/assets/chevron-right.svg"
        }

        background: Rectangle {
            implicitWidth: 200
            implicitHeight: 32
            opacity: enabled ? 1 : 0.3
            border.width: 0
            color: menuItem.hovered ? (!menuItem.down ? Style.activeColor2 : Style.activeColor1) : "transparent"
            Behavior on color { ColorAnimation { duration: Style.microAnimDuration } }
        }
    }
}
