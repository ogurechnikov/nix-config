import Quickshell
import QtQuick
import QtQuick.Layouts

PanelWindow {
    anchors {
        top: true
        left: true
        right: true
    }
    implicitHeight: 36
    color: Colors.base00

    Item {
        anchors.fill: parent
        anchors.leftMargin: 12
        anchors.rightMargin: 12

        RowLayout {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            Workspaces {}
        }

        Clock {
            anchors.centerIn: parent
        }

        RowLayout {
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            Text {
                text: "wifi | en | 🔔 | ⏻"
                color: Colors.base05
            }
        }
    }
}
