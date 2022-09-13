import QtQuick 6.3
import QtQuick.Controls 6.3
import QtQuick.Controls.Universal 6.3
import "qrc:/components/ui"

Rectangle {
    id: root
    color: Style.backgroundColor
    clip: true

    Rectangle {
        id: bottomStackHeader
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
            icon.source: "qrc:/assets/subtract-filled.svg"
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
            icon.source: "qrc:/assets/settings-filled.svg"
            icon.height: 16
            icon.width: 16
            flat: true
            width: 32
        }
    }
}
