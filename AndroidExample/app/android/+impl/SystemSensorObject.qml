import QtQuick
import QtQuick.Controls.Material
import "qrc:/app/settings"

Item{
    id: impl
    property string description
    property alias text: sensorText.text
    property alias name: nameText.text
    property alias imgUrl:  imgtype.source
    signal update
    Material.accent: AppSettings.accent
    Column{
        id: column
        anchors.centerIn: parent
        width: parent.width *0.9
        spacing: parent.height * 0.08
        Row {
            spacing: 16
            Rectangle{
                anchors.verticalCenter: parent.verticalCenter
                height: 128
                width: 128
                border.width: 2
                border.color: Material.accentColor
                Image {
                    id: imgtype
                    anchors.fill: parent
                    anchors.margins: 2
                    cache: false
                }
            }
            Item{
                anchors.verticalCenter: parent.verticalCenter
                width: column.width - parent.spacing - 128
                height: 128
                Column{
                    anchors.top: parent.top
                    Text{
                        id: nameText
                        font.pixelSize: 16
                        font.bold: true
                        color: Material.foreground
                    }
                    Text{
                        font.bold: true
                        color: Material.foreground
                        text: "[ Sensor Data ]"
                    }
                    Text{
                         id: sensorText
                         color: "#8A8A8A"
                    }
                }
                Text{
                    visible: description === ""
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 16
                    font.bold: true
                    text: "- 此设备不支持 -"
                    color: "#AFAFAF"
                }
            }
        }
        Rectangle{
            visible: description !== ""
            width: column.width
            height: 20
            radius: 10
            color: Material.accentColor
            Text{
                id: descriptionText
                anchors.centerIn: parent
                width: parent.width - parent.height
                font.pixelSize: 10
                font.bold: true
                font.italic: true
                elide: Text.ElideRight
                text: "描述 - "+description
                color: "#DFDFDF"
            }
        }
        Timer {
            interval: 50
            running: description !== ""
            repeat: true
            onTriggered: impl.update()
        }
    }
}
