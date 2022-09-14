import QtQuick 6.3
import QtQuick.Controls.Universal 6.3
import "qrc:/components/ui"

Rectangle {
    id: root
    color: Style.backgroundColor

    PushButton {
        id: minimizeButton
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        icon.source: "qrc:/assets/panel-left-contract.svg"
        icon.height: 16
        icon.width: 16
        flat: true
        height: 32
    }
}
