// Bar.qml - компонент top bar.

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
	color: "#1e1e2e"

	Item {
		anchors.fill: parent
		anchors.leftMargin: 12
		anchors.rightMargin: 12

		// Left
		RowLayout {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter

			Workspaces {}
        }
		
		// Center
		Clock {
			anchors.centerIn: parent
		}

		// Right
		RowLayout {
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter

            Text {
                text: "wifi | en | 🔔 | ⏻"
                color: "#cdd6f4"
            }
		}
	}
}
