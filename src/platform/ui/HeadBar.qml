import QtQuick 6.3
import QtQuick.Controls 6.3
import QtQuick.Controls.Universal 6.3
import "qrc:/components/ui"

Rectangle {
    id: root
    color: Style.backgroundColor

    PushButton {
        id: projectButton
        icon.source: "qrc:/assets/logo-stroked.svg"
        text: project.name
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        flat: true
    }

    Row {
        id: menuRow
        anchors.left: projectButton.right
        anchors.leftMargin: 16
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        PushButton {
            id: fileButton
            text: qsTr("File")
            flat: true
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            enabled: project.available
        }

        PushButton {
            id: viewsButton
            text: qsTr("Views")
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            flat: true
        }

        PushButton {
            id: helpButton
            text: qsTr("Help")
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            flat: true
        }

        PushButton {
            id: aboutButton
            text: qsTr("About")
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            flat: true
        }
    }

    PushButton {
        id: engineStatusButton
        icon.source: "qrc:/assets/flash.svg"
        icon.height: 16
        icon.width: 16
        anchors.right: alertButton.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        flat: true
        width: 32
    }

    PushButton {
        id: alertButton
        icon.source: "qrc:/assets/alert.svg"
        icon.height: 16
        icon.width: 16
        anchors.right: navigationButton.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        flat: true
        width: 32
    }

    PushButton {
        id: navigationButton
        icon.source: "qrc:/assets/navigation.svg"
        icon.height: 16
        icon.width: 16
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        flat: true
        width: 32
    }
}
