import QtQuick 6.3
import QtQuick.Controls.Universal 6.3
import "qrc:/components/ui"

Rectangle {
    id: root
    color: Style.backgroundColor

    PushButton {
        id: minimizeButton
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        icon.source: "qrc:/assets/align-bottom-filled.svg"
        icon.height: 16
        icon.width: 16
        flat: true
        width: 32
    }
}
