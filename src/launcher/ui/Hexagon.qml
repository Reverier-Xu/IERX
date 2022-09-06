import QtQuick 2.15

Rectangle {
    id: root
    color: "transparent"
    width: 36
    height: 36
    radius: 18

    property bool active: false
    opacity: root.active ? 0.5 : 0.1

    Behavior on opacity {
        NumberAnimation {
            duration: 500
        }
    }

    Image {
        id: image
        source: "qrc:/assets/hexagon.svg"
        anchors.centerIn: parent
        width: 36
        height: 36
        sourceSize.width: 36
        sourceSize.height: 36
        smooth: true
        antialiasing: true
    }
}
