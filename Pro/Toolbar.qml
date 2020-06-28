import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

RowLayout {
    signal newGame()
    signal quitApp()
    signal levelPrevious()
    signal levelNext()
    Layout.bottomMargin: 2

    function setTime(t) {
        timerField.text = t
    }

    function setLevel(l) {
        levelField.text = l
    }

    spacing: 2

    Button {
        id: newGameButton
        text: "Restart"
        onClicked: newGame()
    }

    Button  {
        id: levelChangePrevious
        text: "Previous"
        onClicked: levelPrevious()
    }

    TextField {
        id: levelField
        Layout.minimumWidth: 40
        Layout.maximumWidth: 40
    }

    Button  {
        id: levelChangeNext
        text: "Next"
        onClicked: levelNext()
    }

    TextField {
        id: timerField
        Layout.fillWidth: true
    }

    Button {
        padding: 2
        id: quitButton
        text: "Quit"
        onClicked: quitApp()
    }

    Shortcut {
        context: Qt.ApplicationShortcut
        sequences: ["Ctrl+N"]
        onActivated: newGame()
    }

    Shortcut {
        context: Qt.ApplicationShortcut
        sequences: [StandardKey.close, "Ctrl+Q"]
        onActivated: quitApp()
    }
}
