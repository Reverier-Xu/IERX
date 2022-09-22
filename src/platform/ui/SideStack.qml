import QtQuick 6.3
import QtQuick.Controls.Universal 6.3
import "qrc:/components/ui"

Rectangle {
    id: root
    color: Style.backgroundColor
    clip: true

    visible: platform.showSideStack

    Rectangle {
        id: sideStackHeader
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: 32
        color: Style.activeColor1

        Rectangle {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            color: Style.activeColor1
            height: 1
        }

        PushButton {
            id: minimizeButton
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            icon.source: "qrc:/assets/subtract.svg"
            icon.height: 16
            icon.width: 16
            flat: true
            width: 32
        }

        PushButton {
            id: settingsButton
            anchors.right: minimizeButton.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            icon.source: "qrc:/assets/settings.svg"
            icon.height: 16
            icon.width: 16
            flat: true
            width: 32
        }
    }
}
