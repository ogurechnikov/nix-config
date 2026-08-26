// Workspaces.qml — индикаторы рабочих столов niri.

import QtQuick
import QtQuick.Layouts
import Quickshell.Io

Item {
    id: root

    property var workspaces: []

    Process {
        id: workspaceProcess

        command: ["niri", "msg", "-j", "workspaces"]

        stdout: StdioCollector {
            id: collector
            onStreamFinished: {
                root.workspaces = JSON.parse(collector.text)
            }
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: workspaceProcess.running = true
    }

    RowLayout {
        anchors.verticalCenter: parent.verticalCenter
        spacing: 6

        Repeater {
            model: root.workspaces

            Rectangle {
                width: 10
                height: 10
                radius: 5

                color: modelData.is_active ? "#585b70" : "#89b4fa"
            }
        }
    }

    implicitWidth: 100
    implicitHeight: 20
}
