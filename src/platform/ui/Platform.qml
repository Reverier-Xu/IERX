import QtQuick 2.15
import QtQuick.Window 2.15
import "qrc:/components/ui"

Window {
    id: root
    flags: Qt.Window
    visible: true

    width: 1200
    minimumWidth: 1200
    height: 700
    minimumHeight: 700

    Rectangle {
        id: centralWidget
        anchors.fill: parent
        color: Style.backgroundColor

        HeadBar {
            id: headbar
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            height: 32
        }

        Rectangle {
            id: headbarDivider
            anchors.left: headbar.left
            anchors.top: headbar.bottom
            anchors.right: headbar.right
            height: 1
            color: Style.dividerColor
        }

        SideBar {
            id: sidebar
            anchors.left: parent.left
            anchors.top: headbarDivider.bottom
            anchors.bottom: statusbarDivider.top
            width: 32
        }

        Rectangle {
            id: sidebarDivider
            anchors.left: sidebar.right
            anchors.top: sidebar.top
            anchors.bottom: sidebar.bottom
            width: 1
            color: Style.dividerColor
        }

        BottomBar {
            id: bottombar
            anchors.bottom: statusbarDivider.top
            anchors.left: sidebarDivider.right
            anchors.right: parent.right
            height: 32
        }

        Rectangle {
            id: bottombarDivider
            anchors.left: bottombar.left
            anchors.right: bottombar.right
            anchors.bottom: bottombar.top
            height: 1
            color: Style.dividerColor
        }

        StatusBar {
            id: statusbar
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            height: 32
        }

        Rectangle {
            id: statusbarDivider
            anchors.left: statusbar.left
            anchors.right: statusbar.right
            anchors.bottom: statusbar.top
            height: 1
            color: Style.dividerColor
        }

        SideStack {
            id: sidestack
            anchors.left: sidebarDivider.right
            anchors.top: headbarDivider.bottom
            anchors.bottom: bottombarDivider.top
            anchors.right: sidestackDivider.left
        }

        Rectangle {
            id: sidestackDivider
            anchors.top: sidestack.top
            anchors.bottom: sidestack.bottom
            width: 1
            color: sidestackDragArea.pressed ? Style.accentColor : Style.dividerColor
            Behavior on color { ColorAnimation { duration: Style.microAnimDuration } }

            property double percent: 0.25
            x: percent * root.width

            MouseArea {
                 id: sidestackDragArea
                 hoverEnabled: true
                 cursorShape: containsMouse ? Qt.SizeHorCursor : Qt.ArrowCursor
                 anchors.horizontalCenter: parent.horizontalCenter
                 anchors.top: parent.top
                 anchors.bottom: parent.bottom
                 width: 3

                 drag.target: parent
                 drag.axis: Drag.XAxis
                 drag.minimumX: sidestack.x + 200
                 drag.maximumX: root.width - 400

                 onReleased: {
                     sidestackDivider.percent = sidestackDivider.x / root.width
                 }
            }
        }

        BottomStack {
            id: bottomstack
            anchors.left: sidestackDivider.right
            anchors.bottom: bottombarDivider.top
            anchors.right: parent.right
            anchors.top: bottomstackDivider.bottom
        }

        Rectangle {
            id: bottomstackDivider
            anchors.left: bottomstack.left
            anchors.right: bottomstack.right
            height: 1
            color: bottomstackDragArea.pressed ? Style.accentColor : Style.dividerColor
            Behavior on color { ColorAnimation { duration: Style.microAnimDuration } }

            property double percent: 0.7
            y: percent * root.height

            MouseArea {
                 id: bottomstackDragArea
                 hoverEnabled: true
                 cursorShape: containsMouse ? Qt.SizeVerCursor : Qt.ArrowCursor
                 anchors.verticalCenter: parent.verticalCenter
                 anchors.left: parent.left
                 anchors.right: parent.right
                 height: 3

                 drag.target: parent
                 drag.axis: Drag.YAxis
                 drag.minimumY: 200
                 drag.maximumY: root.height - 200

                 onReleased: {
                     bottomstackDivider.percent = bottomstackDivider.y / root.height
                 }
            }
        }

        MainStack {
            id: mainstack
            anchors.left: sidestackDivider.right
            anchors.top: headbarDivider.bottom
            anchors.right: parent.right
            anchors.bottom: bottomstackDivider.top
        }
    }

    onClosing: function(close) {
        close.accepted = false
        platform.requestQuit()
    }
}
