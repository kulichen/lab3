import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12

Window {
    id: w
    visible: true

    minimumWidth: cl.width
    maximumWidth: cl.width
    width: cl.width

    minimumHeight: cl.height
    maximumHeight: cl.height

    title: qsTr("DrawPie!")

    ColumnLayout {
        id: cl
        spacing: 2

        RowLayout {
            id: rl
            spacing: 2

            Leftfield   {
                id: leftfield
                Layout.leftMargin: 2
            }

            ColumnLayout {
                spacing: 2

                Upfield {
                    id: upfield
                    Layout.rightMargin: 2
                }

                Gameplay {
                    id: gameplay
                    Layout.rightMargin: 2
                }
            }
        }

        Toolbar {
            id: toolbar
            Layout.leftMargin: 2
            Layout.rightMargin: 2
            spacing: 2
            onNewGame: gameplay.newGame()
            onQuitApp: Qt.quit()
            onLevelNext: {
                gameplay.levelNext()
                leftfield.levelNext()
                upfield.levelNext()
            }
            onLevelPrevious: {
                gameplay.levelPrevious()
                leftfield.levelPrevious()
                upfield.levelPrevious()
            }
        }
    }
}
