import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2

GridLayout {
    id: gp
    width: 600
    height: 600

    columns: 10
    rows: 10

    columnSpacing: 0
    rowSpacing: 0

    property bool playing: false
    property int secondsPassed: 0
    property int lvl: 1

    function checkWin2() {
        var configs = []
        for(var i = 0; i < bricks.model; i++)
            configs.push(bricks.itemAt(i).config)
        var res = helper.checkWin(configs, lvl)
        if(res) {
            playing = false
            winDialog.open()
        }
    }

    function newGame(){
        playing = true
        secondsPassed = 0

        var newGameConfigs = helper.newGame(lvl)
        for (var i = 0; i < bricks.model; i++){
            bricks.itemAt(i).config = newGameConfigs[i]
        }
        updateTime()
        updateLevel()
    }

    function updateTime() {
        var textTime = "Time: " + String(Math.floor(secondsPassed/ 60)) +
                ":" + String(secondsPassed % 60)
        toolbar.setTime(textTime)
    }

    function updateLevel() {
        var textLevel = String(lvl)
        toolbar.setLevel(textLevel)
    }

    function levelNext  () {
        if (lvl < 6) {
            lvl += 1
            updateLevel()
            newGame()
        }
    }

    function levelPrevious() {
        if (lvl > 1) {
            lvl -= 1
            updateLevel()
            newGame()
        }
    }

    MessageDialog {
        id: winDialog

        title: "YOU WON!"
        text:
            if (lvl + 1 === 7) "Game over!\n" + String(lvl) + " - " + String(secondsPassed) + " sec"
            else "Eeeaaaahhh... Baby!!!\nLvl " + String(lvl) + " - " + String(secondsPassed) + " sec"
        onAccepted: {
            levelNext()
            newGame()
            leftfield.levelNext()
            upfield.levelNext()
        }
        visible: false
    }

    Timer {
        id: countdown
        interval: 1000
        repeat: true
        running: gameplay.playing
        triggeredOnStart: false
        onTriggered: {
            secondsPassed++
            updateTime()
        }
    }

    Repeater {
        id: bricks
        model: 100

        Brick {
            onCheckWin: checkWin2()
        }
    }

    Component.onCompleted: {
        newGame()
    }
}
