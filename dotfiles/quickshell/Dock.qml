// Dock.qml — панель запущенных приложений снизу экрана.
import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import Quickshell.Widgets
import Quickshell

PanelWindow {
    anchors {
        bottom: true
		left: true
		right: true
    }

    implicitHeight: 64
    color: "transparent"

    property var windows: []
	property int iconSize: 30

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

	Process {
		id: focusProcess
	}

	Rectangle {
        id: dockBackground

        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 8

        width: rowLayout.implicitWidth + 24
        height: 48

        radius: 16
        color: Colors.base00
        border.width: 2
        border.color: Colors.base02

        RowLayout {
            id: rowLayout
            anchors.centerIn: parent
            spacing: 10

            Repeater {
                model: windows

                Item {
                    id: iconSlot
                    implicitWidth: iconSize + 12
                    implicitHeight: iconSize + 12

                    Rectangle {
                        id: hoverBackground
                        anchors.fill: parent
                        radius: 10
                        color: mouseArea.containsMouse ? Colors.base01 : "transparent"

                        Behavior on color {
                            ColorAnimation { duration: 150 }
                        }
                    }

                    IconImage {
                        anchors.centerIn: parent
                        implicitSize: iconSize
                        source: {
                            var entry = DesktopEntries.byId(modelData.app_id)
                            return entry ? Quickshell.iconPath(entry.icon) : ""
                        }
                    }

                    MouseArea {
                        id: mouseArea
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            focusProcess.command = ["niri", "msg", "action", "focus-window", "--id", String(modelData.id)]
                            focusProcess.running = true
                        }
                    }
                }
            }
        }
    }
}
