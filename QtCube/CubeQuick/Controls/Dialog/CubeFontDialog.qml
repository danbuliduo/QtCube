import QtQuick
import QtQuick.Controls

CubeDialogTemplate {
    property font currentFont
    property alias pixelSizeFrom: spinbox.from
    property alias pixelSizeTo: spinbox.to
    id:control
    width: 320
    height: 280
    title: "FontDialog"
    leftPadding: 12
    rightPadding: 12
    topPadding: 4
    bottomPadding: 0
    standardButtons: Dialog.Ok | Dialog.Cancel
    contentItem: Item{
        ListView{
            id: fontListView
            height: parent.height
            width: parent.width*0.6
            model: Qt.fontFamilies()
            clip: true
            delegate: RadioDelegate {
                padding: 2
                height: 42
                width: fontListView.width
                font.family: modelData
                font.pixelSize: 12
                text: (index+1) + ". " + modelData
                onClicked:  {
                    control.currentFont.family=font.family
                }
            }
        }
        Item {
            height: parent.height
            width: parent.width*0.4//-control.rightPadding
            anchors.right: parent.right
            ScrollView {
                id: scrollview
                anchors.horizontalCenter: parent.horizontalCenter
                height: parent.height*0.2
                width: parent.width - 16
                Text{
                    x: (scrollview.width - width >0) ? (scrollview.width - width )/2 : 0
                    y: (scrollview.height - height >0) ? (scrollview.height - height)/2 : 0
                    text: "AaBb"
                    color: Material.foreground
                    font: control.currentFont
                }
            }
            SpinBox{
                id : spinbox
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: scrollview.bottom
                anchors.bottomMargin: -16
                from: 0
                to: 99
                value: 12
                editable: true
                width: 100
                onValueChanged: currentFont.pixelSize = value
            }
            Flickable{
                clip: true
                anchors.bottom: parent.bottom
                anchors.top: spinbox.bottom
                width: parent.width
                contentWidth: width
                contentHeight: column.height
                Column {
                   id: column
                   x:16
                   spacing:  - 14
                   CheckBox{
                       text: "粗体"
                       onClicked: control.currentFont.bold = checkState !== Qt.Unchecked? true : false
                   }
                   CheckBox{
                       text: "斜体"
                       onClicked: control.currentFont.italic = checkState !== Qt.Unchecked ? true : false
                   }
                   CheckBox{
                       text: "下划线"
                       onClicked:  control.currentFont.underline  = checkState !== Qt.Unchecked ? true : false
                   }
                   CheckBox{
                       text: "删除线"
                       onClicked: control.currentFont.strikeout  = checkState !== Qt.Unchecked ? true : false
                   }
               }
                ScrollIndicator.vertical: ScrollIndicator { }
            }
            Rectangle{
                anchors.left: parent.left
                height: parent.height
                width: 1
                color: "#DDDDDD"
            }
        }
    }
}
