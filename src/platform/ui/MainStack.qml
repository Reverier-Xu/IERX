import QtQuick 6.3
import QtQuick.Controls 6.3
import "qrc:/components/ui"

Rectangle {
    id: root
    color: Style.backgroundColor
    clip: true

    Rectangle {
        id: mainStackHeader
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: 32
        color: "transparent"

        Rectangle {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            color: Style.activeColor2
            height: 1
        }

        PushButton {
            id: pagesButton
            anchors.right: moreButton.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            icon.source: "qrc:/assets/chevron-down.svg"
            icon.height: 16
            icon.width: 16
            flat: true
            width: 32
        }

        PushButton {
            id: moreButton
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            icon.source: "qrc:/assets/more-horizontal.svg"
            icon.height: 16
            icon.width: 16
            flat: true
            width: 32
        }
    }
}
