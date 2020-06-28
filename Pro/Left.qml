import QtQuick 2.0

Rectangle {
    id: rectangle
    width: 120
    height: 58
    color: "gray"

    property string config: ""
    //signal Changed

    Text {
        color: "#dfdfdf"
        text: String(config)
        anchors.left: parent.left
        anchors.leftMargin: 3
        anchors.verticalCenter: parent.verticalCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 29
        font.letterSpacing: 0
        font.wordSpacing: 0.2
        textFormat: Text.RichText
        font.family: "Arial"
        horizontalAlignment: Text.AlignHCenter
    }
}
