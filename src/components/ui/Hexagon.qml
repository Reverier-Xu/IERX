import QtQuick 6.3
import "."

Rectangle {
    id: root
    color: "transparent"
    width: 36
    height: 36
    radius: 18

    property bool active: false
    opacity: root.active ? 0.8 : 0.1

    Behavior on opacity {
        NumberAnimation {
            duration: Style.longAnimDuration
        }
    }

    Image {
        id: image
        source: "qrc:/assets/hexagon.svg"
        anchors.centerIn: parent
        width: 32
        height: 32
        sourceSize.width: 32
        sourceSize.height: 32
    }
}
