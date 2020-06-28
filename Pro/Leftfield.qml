import QtQuick 2.12
import QtQuick.Layouts 1.12

ColumnLayout {
    id: lCl

    spacing: 2

    Rectangle {
        color: "grey"
        width: 120
        height: 120
    }

    property int lvl: 1

    function newLevel(){

        for (var j = 0; j < 10; j++)
            lFields.itemAt(j).config = ""

        var a = 0
        var newGameConfigs = helper.startGame(lvl)
        for (var i = 0; i < newGameConfigs.length; i++){
            if (newGameConfigs[i] === 1){
                a += 1
            }
            else {
                if (a !== 0) lFields.itemAt(i / 10).config += String(a) + " "
                a = 0
            }
            if (i % 10 === 9 && a !== 0){
                lFields.itemAt(i / 10).config += String(a) + " "
                a = 0
            }
        }
    }

    function levelNext  () {
        if (lvl < 6) {
            lvl += 1
            newLevel()
        }
    }

    function levelPrevious() {
        if (lvl > 1) {
            lvl -= 1
            newLevel()
        }
    }

    Repeater {
        id:lFields
        model: 10

        Left {

        }
    }

    Rectangle {
        width: 120
        height: 0
    }

    Component.onCompleted: {
        newLevel()
    }
}
