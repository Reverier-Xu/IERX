import QtQuick 6.3
import QtQuick.Controls 6.3
import QtQuick.Controls.Universal 6.3
import "qrc:/components/ui"

PushButton {
    id: root
    height: 32
    property real maxValue: 100
    property real currentValue: 0
    property string currentText: ""
    property string maxText: ""
    text: currentText === "" && maxText === "" ? currentValue.toString() + "/" + maxValue.toString() : currentText + "/" + maxText
    flat: true

    Rectangle {
        id: progressBar
        height: 1
        anchors.left: parent.left
        anchors.leftMargin: 4
        anchors.right: parent.right
        anchors.rightMargin: 4
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4
        color: Style.activeColor2

        Rectangle {
            id: currentProgressBar
            height: 1
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            color: Style.accentColor
            width: parent.width * (root.currentValue / root.maxValue)
        }
    }
}