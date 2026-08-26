// Bar.qml - компонент top bar.

import QuickShell
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

	RowLayout {
		anchors.fill: parent
		anchors.leftMargin: 12
		anchors.rightMargin: 12

		// Left
		Text {
			text: "workspaces"
			color: "#cdd6f4"
			Layout.alignment: Qt.AlignVCenter
		}

		Item { Layout.fillWidth: true }

		// Center
		Clock {
			Layout.alignment: Qt.AlignVCenter
		}

		// Right
		Text {
			text: "wifi | en | 🔔 | ⏻"
            color: "#cdd6f4"
            Layout.alignment: Qt.AlignVCenter
		}
	}
}
