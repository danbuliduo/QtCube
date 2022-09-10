import QtQuick
import QtQuick.Controls
import "qrc:/app/settings/"

Page{
    id: root
    header: ToolBar {
        Material.primary: Material.accentColor
        contentHeight : application.header.height
        Item{
            height: 40
            width: parent.width
            anchors.bottom: parent.bottom
            ToolButton{
                id : toolButton
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                icon.color: "#FFFFFF"
                icon.source: "qrc:/res/svg/icon-back.svg"
                icon.height: 24
                icon.width: 24
                onClicked: {
                    AppActivities.clickedActivity(0)
                    root.visible = false
                    application.stackviewPOP()
                }
            }
            Text{
                id: titleText
                anchors.centerIn: parent
                color: "#FFFFFF"
                font.pixelSize: 18
                font.bold: true
                text: root.title
            }
        }
    }
}
