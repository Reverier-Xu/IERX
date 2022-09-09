import QtQuick 6.3
import QtQuick.Controls 6.3
import QtQuick.Controls.Universal 6.3
import "qrc:/components/ui"

Rectangle {
    id: root
    color: Style.backgroundColor

    PushButton {
        id: projectButton
        icon.source: project.available ? "qrc:/assets/star.svg" : "qrc:/assets/star-off.svg"
        icon.height: 16
        icon.width: 16
        text: qsTr("No Active Project")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        flat: true

        onClicked: {
            projectContextMenu.popup(x, y + height)
        }

        WrappedMenu {
            id: projectContextMenu
            padding: 1
            opacity: visible ? 1 : 0

            Action {
                text: "Create..."
            }
            Action {
                text: "Open..."
            }
            Action {
                text: "Save..."
            }
        }
    }

    PushButton {
        id: aboutButton
        icon.source: "qrc:/assets/info.svg"
        icon.height: 16
        icon.width: 16
        anchors.right: settingsButton.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        flat: true
    }

    PushButton {
        id: settingsButton
        icon.source: "qrc:/assets/settings.svg"
        icon.height: 16
        icon.width: 16
        anchors.right: moreButton.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        flat: true
    }

    PushButton {
        id: moreButton
        icon.source: "qrc:/assets/navigation.svg"
        icon.height: 16
        icon.width: 16
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        flat: true
    }
}
