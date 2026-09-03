// Clock.qml — компонент живых часов.
import QtQuick

Item {
    id: root
    property string time: ""

    readonly property var monthNames: [
        "января", "февраля", "марта", "апреля", "мая", "июня",
        "июля", "августа", "сентября", "октября", "ноября", "декабря"
    ]

    function updateTime() {
        var now = new Date()
        var day = now.getDate()
        var month = monthNames[now.getMonth()]
        var year = now.getFullYear()
        var hours = String(now.getHours()).padStart(2, "0")
        var minutes = String(now.getMinutes()).padStart(2, "0")
        root.time = day + " " + month + " " + year + ", " + hours + ":" + minutes
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: root.updateTime()
    }

    Component.onCompleted: root.updateTime()

    Text {
        id: clockText
        anchors.verticalCenter: parent.verticalCenter
        text: root.time
        color: Tokens.textSecondary
        font.pixelSize: Tokens.textSm
    }

    implicitWidth: clockText.implicitWidth
    implicitHeight: clockText.implicitHeight
}
