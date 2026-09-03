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
    color: Tokens.voidColor

    Item {
        anchors.fill: parent
        anchors.leftMargin: Tokens.space12
        anchors.rightMargin: Tokens.space12

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
            spacing: Tokens.space12

            Keyboard {}

            Text {
                text: "wifi | 🔔 | ⏻"
                color: Tokens.textPrimary
                font.pixelSize: Tokens.textMd
            }
        }
    }
}
