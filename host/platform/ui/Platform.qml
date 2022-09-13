import QtQuick 6.3
import QtQuick.Controls 6.3
import QtQuick.Controls.Universal 6.3
import QtQuick.Window 6.3
import "qrc:/components/ui"

ApplicationWindow {
    id: root
    flags: Qt.Window
    visible: true

    width: 1200
    minimumWidth: 1200
    height: 700
    minimumHeight: 700

    Universal.theme: Universal.Dark
    Universal.accent: Style.accentColor
    Universal.foreground: Style.contentColor
    Universal.background: Style.backgroundColor

    Rectangle {
        id: centralWidget
        anchors.fill: parent
        color: Style.backgroundColor

        HeadBar {
            id: headBar
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            height: 32
        }

        Rectangle {
            id: headBarDivider
            anchors.left: headBar.left
            anchors.top: headBar.bottom
            anchors.right: headBar.right
            height: 1
            color: Style.dividerColor
        }

        SideBar {
            id: sideBar
            anchors.left: parent.left
            anchors.top: headBarDivider.bottom
            anchors.bottom: statusBarDivider.top
            width: 32
        }

        Rectangle {
            id: sideBarDivider
            anchors.left: sideBar.right
            anchors.top: sideBar.top
            anchors.bottom: sideBar.bottom
            width: 1
            color: Style.dividerColor
        }

        StatusBar {
            id: statusBar
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            height: 32
        }

        Rectangle {
            id: statusBarDivider
            anchors.left: statusBar.left
            anchors.right: statusBar.right
            anchors.bottom: statusBar.top
            height: 1
            color: Style.dividerColor
        }

        SplitView {
            id: horSplitView
            anchors.left: sideBarDivider.right
            anchors.top: headBarDivider.bottom
            anchors.bottom: statusBarDivider.top
            anchors.right: parent.right

            orientation: Qt.Horizontal

            SideStack {
                id: sideStack
                implicitWidth: 240
                SplitView.minimumWidth: 150
                SplitView.preferredWidth: 240
            }

            SplitView {
                id: verSplitView
                orientation: Qt.Vertical

                SplitView.minimumWidth: 500
                SplitView.fillWidth: true

                MainStack {
                    id: mainStack
                    SplitView.minimumHeight: 300
                    SplitView.fillHeight: true
                }

                BottomStack {
                    id: bottomStack
                    implicitHeight: 180
                    SplitView.minimumHeight: 150
                    SplitView.preferredWidth: 180
                }

                handle: Rectangle {
                    id: verSplitHandle
                    implicitHeight: 1
                    color: SplitHandle.pressed ? Style.accentColor : Style.dividerColor

                    containmentMask: Item {
                        y: (verSplitHandle.height - height) / 2
                        height: 7
                        width: verSplitView.width
                    }
                }
            }

            handle: Rectangle {
                id: horSplitHandle
                implicitWidth: 1
                color: SplitHandle.pressed ? Style.accentColor : Style.dividerColor

                containmentMask: Item {
                    x: (horSplitHandle.width - width) / 2
                    width: 7
                    height: horSplitView.height
                }
            }
        }
    }

    onClosing: function(close) {
        close.accepted = false
        platform.requestQuit()
    }
}
