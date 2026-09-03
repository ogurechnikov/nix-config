// Keyboard.qml — индикатор текущей раскладки клавиатуры.
import QtQuick
import Quickshell.Io

Item {
    id: root

    property string current: "En"

    function shortName(name) {
        if (name.indexOf("Russian") !== -1) return "Ru"
        if (name.indexOf("English") !== -1) return "En"
        return name.substring(0, 2)
    }

    Process {
        id: layoutProcess
        command: ["niri", "msg", "-j", "keyboard-layouts"]
        stdout: StdioCollector {
            id: collector
            onStreamFinished: {
                var data = JSON.parse(collector.text)
                root.current = root.shortName(data.names[data.current_idx])
            }
        }
    }

    Timer {
        interval: 500
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: layoutProcess.running = true
    }

    Text {
        id: label
        anchors.verticalCenter: parent.verticalCenter
        text: root.current
        color: Tokens.textSecondary
        font.pixelSize: Tokens.textSm
    }

    implicitWidth: label.implicitWidth
    implicitHeight: label.implicitHeight
}
