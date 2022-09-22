import QtQuick 6.3
import QtQuick.Controls.Universal 6.3
import "qrc:/components/ui"

Rectangle {
    id: root
    color: Style.backgroundColor

    PushButton {
        id: minimizeButton
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        icon.source: "qrc:/assets/chevron-double-left.svg"
        icon.height: 16
        icon.width: 16
        flat: true
        height: 32
        enabled: project.available
        rotation: platform.showSideStack ? 0 : 180
        Behavior on rotation {
            NumberAnimation {
                duration: Style.normalAnimDuration
                easing.type: Easing.OutQuad
            }
        }
        onClicked: {
            platform.showSideStack = !platform.showSideStack
        }
    }
}
