import QtQuick 2.0

Rectangle{
    width: 60
    height: 60
    color: "darkgray"

    property int config: 3
    border.width: 1
    border.color: "black"

    signal checkWin()

    function change() {
        if (config != 3) {
            if (config < 2)
                config += 1
            else
                config = 1
        }
        checkWin()
    }

    Rectangle {
        x: 1; y: 1; width: 58; height: 58
        color: "#ff9381"
        visible: (parent.config) == 3
    }

    Rectangle {
        x: 1; y: 1; width: 58; height: 58
        color: "#ff8181"
        visible: (parent.config) == 2
    }

    Rectangle {
        x: 1; y: 1; width: 58; height: 58
        color: "#525252"
        visible: (parent.config) == 1
    }

    MouseArea {
        anchors.fill: parent

        onClicked: {
            if(gameplay.playing) {
                change()
            }
        }
    }
}
