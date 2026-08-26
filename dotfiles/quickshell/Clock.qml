// Clock.qml — компонент живых часов.

import QtQuick

// Item — самый базовый "пустой" QML-тип, ничего не рисует сам,
// просто контейнер с геометрией. Используем как основу для логики.
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
        anchors.centerIn: parent
        text: root.time
        color: "#cdd6f4"
    }

    // implicitWidth/Height — подсказка родительскому layout,
    // сколько места этот компонент хочет занимать.
    implicitWidth: childrenRect.width
    implicitHeight: childrenRect.height
}
