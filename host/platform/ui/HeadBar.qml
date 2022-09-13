import QtQuick 6.3
import QtQuick.Controls 6.3
import QtQuick.Controls.Universal 6.3
import "qrc:/components/ui"

Rectangle {
    id: root
    color: Style.backgroundColor

    PushButton {
        id: projectButton
        icon.source: "qrc:/assets/logo.svg"
        icon.height: 24
        icon.width: 24
        icon.color: "transparent"
        text: project.name
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        flat: true
    }

    PushButton {
        id: aboutButton
        icon.source: "qrc:/assets/info-filled.svg"
        icon.height: 16
        icon.width: 16
        anchors.right: settingsButton.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        flat: true
        width: 32
    }

    PushButton {
        id: settingsButton
        icon.source: "qrc:/assets/settings-filled.svg"
        icon.height: 16
        icon.width: 16
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        flat: true
        width: 32
    }
}
