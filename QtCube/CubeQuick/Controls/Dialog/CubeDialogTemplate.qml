import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl

Dialog{
    id: control
    x: (parent.width - width) / 2
    y: (parent.height - height) / 2
    title: "TemplateDialog"
    modal: true
    leftPadding: 12
    rightPadding: 12
    closePolicy: Popup.NoAutoClose
    standardButtons: Dialog.NoButton
    Material.elevation: 0
    background: Rectangle {
        id:backgroundRect
        color: control.Material.dialogColor
        radius: 4
        layer.enabled: control.Material.elevation > 0
        layer.effect: ElevationEffect{ elevation: control.Material.elevation}
    }
    header: Item{
        height: 48
        Text{
            text: control.title
            color: control.Material.foreground
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 24
            font.bold: true
            font.pixelSize: 16
        }
        ToolButton{
            anchors.right: parent.right
            anchors.rightMargin: 8
            anchors.verticalCenter: parent.verticalCenter
            icon.source: "qrc:/+Resource/Icon/close.svg"
            icon.color: "#808080"
            onClicked: control.close()
        }
        Rectangle{
            width: parent.width
            height: 1
            color: "#CCCCCC"
            anchors.bottom: parent.bottom
        }
    }
}
