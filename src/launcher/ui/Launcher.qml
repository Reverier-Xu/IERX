import QtQuick 2.15
import QtQuick.Window 2.15
import "qrc:/components/ui"

Window {
    id: root
    flags: Qt.Window | Qt.FramelessWindowHint
    visible: true
    property int animeProc: 1

    width: 480
    height: 200

    Rectangle {
        id: background
        color: Style.backgroundColor
        border.color: Style.dividerColor
        border.width: 1
        anchors.fill: parent

        Hexagon {
            id: hexagon1
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.horizontalCenter
            anchors.leftMargin: 80
            active: root.animeProc % 5 === 1
        }

        Hexagon {
            id: hexagon2
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.horizontalCenter
            anchors.rightMargin: 80
            active: root.animeProc % 3 === 1
        }

        Hexagon {
            id: hexagon3
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: hexagon1.right
            active: root.animeProc % 2 === 1
        }

        Hexagon {
            id: hexagon4
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: hexagon2.left
            active: root.animeProc % 4 === 1
        }

        Hexagon {
            id: hexagon5
            anchors.bottom: hexagon1.top
            anchors.bottomMargin: -4
            anchors.horizontalCenter: hexagon3.right
            active: root.animeProc % 6 === 1
        }

        Hexagon {
            id: hexagon6
            anchors.bottom: hexagon2.top
            anchors.bottomMargin: -4
            anchors.horizontalCenter: hexagon4.left
            active: root.animeProc % 7 === 1
        }

        Hexagon {
            id: hexagon7
            anchors.top: hexagon1.bottom
            anchors.topMargin: -4
            anchors.horizontalCenter: hexagon3.right
            active: root.animeProc % 8 === 1
        }

        Hexagon {
            id: hexagon8
            anchors.top: hexagon2.bottom
            anchors.topMargin: -4
            anchors.horizontalCenter: hexagon4.left
            active: root.animeProc % 9 === 1
        }

        Image {
            id: logo
            property bool active: root.animeProc > 1
            source: "qrc:/assets/logo.svg"
            anchors.centerIn: parent
            sourceSize.width: 128
            sourceSize.height: 128
            width: 128
            height: 128
            opacity: active ? 1 : 0
            Behavior on opacity { NumberAnimation { duration: Style.longAnimDuration } }
        }

        Text {
            id: tipsText
            text: launcher.tips
            color: "#808080"
            font.pixelSize: 16
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 8
        }

        Rectangle {
            height: 1
            color: "#0078D6"
            anchors.left: parent.left
            anchors.leftMargin: 2
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 2
            width: (parent.width - 4) * launcher.progress / 100

            Behavior on width { NumberAnimation { duration: Style.normalAnimDuration; easing.type: Easing.OutExpo } }
        }
    }

    Timer {
        id: timer
        interval: 500
        repeat: true
        running: true
        onTriggered: {
            root.animeProc += 1
        }
    }

    Component.onCompleted: {
        setX(Screen.width / 2 - width / 2)
        setY(Screen.height / 2 - height / 2)
    }
}
