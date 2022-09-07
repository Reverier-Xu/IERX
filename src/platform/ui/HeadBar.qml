import QtQuick 2.15
import "qrc:/components/ui"

Rectangle {
    id: root
    color: Style.backgroundColor

    Image {
        id: logoImage
        sourceSize: Qt.size(24, 24)
        source: "qrc:/assets/logo.svg"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 6
    }

    Text {
        id: projectText
        text: "No Active Project"
        font.pixelSize: 16
        color: Style.contentColor
        anchors.left: logoImage.right
        anchors.leftMargin: 6
        anchors.verticalCenter: parent.verticalCenter
    }
}
