import QtQuick 2.12
import QtQuick.Layouts 1.12

RowLayout {

    spacing: 2

    property int lvl: 1

    function newLevel(){

        for (var k = 0; k < 10; k++)
            uFields.itemAt(k).config = ""

        var a = 0
        var newGameConfigs = helper.startGame(lvl)
        for (var i = 0; i < 10; i++){
            for (var j = 0; j < 10; j++){
                if (newGameConfigs[j * 10 + i] === 1){
                    a += 1
                }
                else {
                    if (a !== 0) uFields.itemAt(i).config += String(a) + "\n"
                    a = 0
                }
                if (j === 9 && a !== 0){
                    uFields.itemAt(i).config += String(a) + "\n"
                    a = 0
                }
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
        id: uFields
        model: 10

        Up {

        }
    }
    Component.onCompleted: {
        newLevel()
    }
}
