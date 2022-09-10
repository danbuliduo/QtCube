import QtQuick
import QtQuick.Controls

Component{
    id: root
    Rectangle{
        border.color: "#8A8A8A"
        color: Material.dialogColor
        radius: 4
        Column{
            anchors.centerIn: parent
            spacing: parent.height*0.05
            Text{
                anchors.horizontalCenter: parent.horizontalCenter
                color: Material.foreground
                font.bold: true
                text: "View - "+stackview.depth
            }
            Button {
                highlighted: true
                anchors.horizontalCenter: parent.horizontalCenter
                text: "PUSH"
                enabled: stackview.depth < 100
                onClicked: stackview.push(stackviewpage)
            }
            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "POP"
                enabled: stackview.depth > 1
                onClicked: stackview.pop()
            }
        }
    }
}
