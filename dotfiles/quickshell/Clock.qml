// Clock.qml — компонент живых часов.
// Раз это будет использоваться только в баре — можно было бы
// встроить прямо в Bar.qml, но выносим отдельно ради читаемости
// и на случай, если позже часы понадобятся ещё где-то (например, в dock).

import QtQuick

// Item — самый базовый "пустой" QML-тип, ничего не рисует сам,
// просто контейнер с геометрией. Используем как основу для логики.
Item {
    id: root

    // property string — реактивное поле с текущим отформатированным
    // временем. Text ниже "подписан" на это поле и обновится
    // автоматически при каждом изменении.
    property string time: ""

    // Русские названия месяцев в родительном падеже
    // ("августа", а не "Август") — так пишут даты по-русски.
    readonly property var monthNames: [
        "января", "февраля", "марта", "апреля", "мая", "июня",
        "июля", "августа", "сентября", "октября", "ноября", "декабря"
    ]

    // Функция форматирования — берёт текущую дату и собирает строку
    // вида "18 августа 2026, 13:57".
    function updateTime() {
        var now = new Date()
        var day = now.getDate()
        var month = monthNames[now.getMonth()]
        var year = now.getFullYear()

        // padStart(2, "0") добавляет ведущий ноль: "9" -> "09"
        var hours = String(now.getHours()).padStart(2, "0")
        var minutes = String(now.getMinutes()).padStart(2, "0")

        root.time = day + " " + month + " " + year + ", " + hours + ":" + minutes
    }

    // Timer вызывает updateTime() каждую секунду.
    // Секунда — с запасом; нам достаточно обновлять раз в минуту,
    // но раз в секунду надёжнее ловит момент смены минуты без задержки.
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: root.updateTime()
    }

    // Component.onCompleted — вызывается один раз, когда компонент
    // только создался. Без этого часы показывали бы пустоту первую секунду.
    Component.onCompleted: root.updateTime()

    // Собственно, что видно на экране — просто текст.
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
