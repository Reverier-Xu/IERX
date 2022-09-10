import QtQuick 2.15
import "."

Rectangle {
    id: root
    property int progress: 0
    property bool noProgress: false
    property int animeProc: 1
    opacity: enabled ? 1 : 0
    visible: enabled
    color: Style.backgroundColor

    Hexagon {
        id: centeredHexagon
        anchors.centerIn: parent
        active: root.animeProc % 2 === 1
    }
    Hexagon {
        id: hexagon1
        anchors.left: centeredHexagon.right
        anchors.verticalCenter: centeredHexagon.verticalCenter
        active: root.animeProc % 3 === 1
    }
    Hexagon {
        id: hexagon2
        anchors.right: centeredHexagon.left
        anchors.verticalCenter: centeredHexagon.verticalCenter
        active: root.animeProc % 4 === 1
    }

    Rectangle {
        id: progressBar
        height: 1
        width: 160
        anchors.top: hexagon2.bottom
        anchors.topMargin: 24
        anchors.horizontalCenter: parent.horizontalCenter
        color: Style.activeColor2

        Rectangle {
            id: currentProgressBar
            height: 1
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            color: Style.accentColor
            width: noProgress ? parent.width : (parent.width * root.progress)
            opacity: root.noProgress ? (root.animeProc % 3 == 1 ? 1 : 0) : 1

            Behavior on opacity {
                NumberAnimation {
                    duration: Style.normalAnimDuration
                }
            }
        }
    }

    Timer {
        id: timer
        interval: 500
        repeat: true
        running: root.enabled
        onTriggered: {
            root.animeProc = (root.animeProc + 1) % 114514
        }
    }

    Component.onDestruction: {
        timer.stop()
    }
}
