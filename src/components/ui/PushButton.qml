import QtQuick 2.15
import "."

PushArea {
    id: root
    property int contentSize: 16
    property bool showIcon: true
    property bool showText: true
    property bool primary: false
    property color contentColor: Style.contentColor
    property alias text: text_.text
    property alias icon: icon_.source

    width: (showText ? text_.width : 0) + contentSize * 1.6 + (showIcon ? contentSize : 0)

    Image {
        id: icon_
        width: root.contentSize
        height: root.contentSize
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: root.showText ? parent.left : undefined
        anchors.horizontalCenter: root.showText ? undefined : parent.horizontalCenter
        anchors.leftMargin: root.contentSize * 0.6
        sourceSize: Qt.size(root.contentSize, root.contentSize)
        smooth: false
        antialiasing: false
        visible: root.showIcon
    }

    Text {
        id: text_
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: root.showIcon ? icon_.right : undefined
        anchors.leftMargin: root.contentSize * 0.5
        anchors.horizontalCenter: root.showIcon ? undefined : parent.horizontalCenter
        color: contentColor
        Behavior on color {
            ColorAnimation {
                duration: Style.microAnimDuration
            }
        }
        font.pixelSize: root.contentSize
        font.bold: root.primary
    }
}
