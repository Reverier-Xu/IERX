import QtQuick 6.3
import QtQuick.Controls 6.3
import QtQuick.Controls.Universal 6.3
import "qrc:/components/ui"


Rectangle {
    id: root
    color: Style.backgroundColor

    Image {
        id: logoImage
        source: "qrc:/assets/logo.svg"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        sourceSize: Qt.size(160, 160)
        opacity: 1
    }

    Text {
        id: welcomeText
        text: qsTr("Welcome to I.E.R.X.")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: logoImage.bottom
        anchors.topMargin: 12
        font.pixelSize: 16
        color: Style.contentColor
        font.bold: true
    }

    Text {
        id: tipsText
        text: project.available ? qsTr("Start your explore") : qsTr("Create a project to start")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: welcomeText.bottom
        anchors.topMargin: 8
        font.pixelSize: 16
        color: Style.contentColor
    }
}
