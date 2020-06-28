import QtQuick 2.0

Rectangle {
    id: rectangle
    width: 58
    height: 120
    color: "gray"

    property string config: ""

    Text {
        color: "#dfdfdf"
        text: String(config)
        anchors.top: parent.top
        anchors.topMargin: 2
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 21
        font.family: "Arial"
    }
}
