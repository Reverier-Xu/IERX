import QtQuick 2.15
import "qrc:/components/ui"

Rectangle {
    id: root
    color: Style.backgroundColor

    PushButton {
        id: projectButton
        icon: project.available ? "qrc:/assets/star.svg" : "qrc:/assets/star-off.svg"
        text: qsTr("No Active Project")
        contentColor: project.available ? Style.contentColor : Style.disabledContentColor
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        flat: true
    }

    PushButton {
        id: aboutButton
        icon: "qrc:/assets/info.svg"
        showText: false
        anchors.right: settingsButton.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        flat: true
    }

    PushButton {
        id: settingsButton
        icon: "qrc:/assets/settings.svg"
        showText: false
        anchors.right: moreButton.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        flat: true
    }

    PushButton {
        id: moreButton
        icon: "qrc:/assets/navigation.svg"
        showText: false
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        flat: true
    }
}
