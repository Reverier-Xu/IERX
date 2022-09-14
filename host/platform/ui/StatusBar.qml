import QtQuick 6.3
import QtQuick.Controls 6.3
import QtQuick.Controls.Universal 6.3
import "qrc:/components/ui"

Rectangle {
    id: root
    color: Style.backgroundColor

    PushButton {
        id: minimizeButton
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        icon.source: "qrc:/assets/panel-left-contract.svg"
        icon.height: 16
        icon.width: 16
        flat: true
        width: 32
        rotation: 270
    }

    ProgressButton {
        id: memoryButton
        anchors.right: minimizeButton.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 160
        currentValue: platform.memoryUsed
        maxValue: platform.memoryTotal
        currentText: (platform.memoryUsed / 1024 / 1024).toFixed(0) + "MiB"
        maxText: (platform.memoryTotal / 1024 / 1024).toFixed(0) + "MiB"
    }
}
