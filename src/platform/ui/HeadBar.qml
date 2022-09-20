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

    Row {
        id: menuRow
        anchors.left: projectButton.right
        anchors.leftMargin: 16
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: taskButton.left

        PushButton {
            id: fileButton
            text: qsTr("File")
            flat: true
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
            id: explorerButton
            text: qsTr("Explorer")
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            flat: true
            enabled: project.available
        }

        PushButton {
            id: binaryButton
            text: qsTr("Binary")
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            flat: true
            enabled: project.available
        }

        PushButton {
            id: forensicsButton
            text: qsTr("Forensics")
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            flat: true
            enabled: project.available
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
        id: taskButton
        icon.source: "qrc:/assets/flash.svg"
        icon.height: 16
        icon.width: 16
        anchors.right: alertButton.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        flat: true
        text: "IDLE"
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
