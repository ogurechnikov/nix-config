// Launcher.qml — поиск и запуск приложений.
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Wayland

PanelWindow {
    id: root

    WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive

    anchors { top: true }
    margins.top: 120

    implicitWidth: 480
    implicitHeight: content.implicitHeight + Tokens.space24 * 2
    color: "transparent"

    visible: false

    property var allApps: DesktopEntries.applications.values
    property string query: ""
    property var filtered: []
    property int selectedIndex: 0

    function refilter() {
        if (query.length === 0) {
            filtered = allApps
        } else {
            var q = query.toLowerCase()
            filtered = allApps.filter(function(app) {
                return app.name.toLowerCase().indexOf(q) !== -1
            })
        }
        selectedIndex = 0
    }

    function launch(app) {
        if (!app) return
        app.execute()
        close()
    }

    function close() {
        root.visible = false
        query = ""
        input.text = ""
        refilter()
    }

	IpcHandler {
		target: "launcher"

		function toggle(): void {
			root.visible = !root.visible
			if (root.visible) {
				input.forceActiveFocus()
			}
		}
	}

    Component.onCompleted: refilter()

    Rectangle {
        id: card
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        width: 480
        height: content.implicitHeight + Tokens.space24 * 2
        radius: Tokens.radiusObject
        color: Tokens.surface
        border.width: 1
        border.color: Tokens.divider

        ColumnLayout {
            id: content
            anchors.fill: parent
            anchors.margins: Tokens.space24
            spacing: Tokens.space16

            TextInput {
                id: input
                Layout.fillWidth: true
                font.pixelSize: Tokens.textLg
                color: Tokens.textPrimary
                focus: true

                onTextChanged: {
                    root.query = text
                    root.refilter()
                }

                Keys.onDownPressed: {
                    if (root.selectedIndex < root.filtered.length - 1)
                        root.selectedIndex++
                }
                Keys.onUpPressed: {
                    if (root.selectedIndex > 0)
                        root.selectedIndex--
                }
                Keys.onReturnPressed: {
                    root.launch(root.filtered[root.selectedIndex])
                }
                Keys.onEscapePressed: root.close()
            }

            Rectangle {
                Layout.fillWidth: true
                height: 1
                color: Tokens.divider
            }

            Repeater {
                model: root.filtered.slice(0, 8)

                delegate: Rectangle {
                    required property var modelData
                    required property int index

                    Layout.fillWidth: true
                    height: 32
                    radius: Tokens.radiusArchitectural
                    color: index === root.selectedIndex ? Tokens.raised : "transparent"

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: Tokens.space8
                        text: modelData.name
                        color: index === root.selectedIndex ? Tokens.textPrimary : Tokens.textSecondary
                        font.pixelSize: Tokens.textMd
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: root.launch(modelData)
                    }
                }
            }
        }
    }
}
