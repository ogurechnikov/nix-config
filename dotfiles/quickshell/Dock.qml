// Dock.qml — панель запущенных приложений снизу экрана.
import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import Quickshell.Widgets
import Quickshell

PanelWindow {
    anchors {
        bottom: true
    }

    implicitHeight: 50
    color: "#1e1e2e"

    property var windows: []

    readonly property int minIconSize: 20
    readonly property int maxIconSize: 30

    readonly property int iconSize: {
        if (windows.length === 0) return maxIconSize
        var available = 600
        var computed = Math.floor(available / windows.length) - 8
        return Math.max(minIconSize, Math.min(maxIconSize, computed))
    }

    Process {
        id: windowsProcess
        command: ["niri", "msg", "-j", "windows"]
        stdout: StdioCollector {
            id: collector
            onStreamFinished: {
                windows = JSON.parse(collector.text)
            }
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: windowsProcess.running = true
    }

    RowLayout {
        anchors.centerIn: parent
        spacing: 8

        Repeater {
            model: windows

            Item {
                implicitWidth: iconSize
                implicitHeight: iconSize

                IconImage {
                    id: icon
                    anchors.fill: parent
                    source: {
                        var entry = DesktopEntries.byId(modelData.app_id)
                        return entry ? Quickshell.iconPath(entry.icon) : ""
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        focusProcess.command = ["niri", "msg", "action", "focus-window", "--id", String(modelData.id)]
                        focusProcess.running = true
                    }
                }
            }
        }
    }

    Process {
        id: focusProcess
    }
}
