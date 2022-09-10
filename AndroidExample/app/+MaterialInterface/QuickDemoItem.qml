import QtQuick
import QtQuick.Controls
import "qrc:/app/settings/"

Flow{
    id: root
    property color icolor: "#4285F4"
    anchors.fill: parent
    Item{
        width: application.width > application.height ? root.width*0.44 : root.width
        height: application.width > application.height ? root.height : root.height*0.4
        ListView{
            id: listview
            anchors.fill: parent
            anchors.topMargin: parent.height*0.05
            anchors.leftMargin: parent.width*0.05
            anchors.rightMargin: application.width > application.height ? 0 : parent.width*0.05
            anchors.bottomMargin: application.width > application.height ? parent.height*0.05 : 0
            spacing: 8
            model: listmodel
            currentIndex: 0
            clip: true
            delegate: Rectangle{
                width:listview.width
                height: 108
                radius: 6
                color: Material.dialogColor
                border.color: Material.theme === Material.Light ? "#EDEDED" : "#525252"
                scale: index === listview.currentIndex ? 1.0 : 0.94
                Behavior on scale {
                    ScaleAnimator{ duration: 120 }
                }
                IconLabel{
                    id: iconLabel
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.topMargin: 20
                    anchors.leftMargin: 24
                    color: Material.foreground
                    icon.width: 36
                    icon.height: 36
                    icon.source: _itemicon
                    icon.color: root.icolor
                    font.bold: true
                    font.pixelSize: 15
                    spacing: 8
                    text: _title
                }
                Rectangle{
                    anchors.top: parent.top
                    anchors.right: parent.right
                    anchors.topMargin: 20
                    anchors.rightMargin: 24
                    width: 36
                    height: 36
                    radius: 4
                    color: Material.accentColor
                    ColorImage{
                        anchors.fill: parent
                        anchors.margins: 4
                        cache: false
                        color: "#FFFFFF"
                        source: "qrc:/res/svg/icon-demoplay.svg"
                    }
                }
                Text{
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.bottomMargin: 20
                    anchors.leftMargin: 24
                    color: "#8A8A8A"
                    font.bold: true
                    text: _author
                }
                Text{
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    anchors.bottomMargin: 20
                    anchors.rightMargin: 24
                    color: "#8A8A8A"
                    text: _version
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        loaderItem(index)
                        listview.currentIndex = index
                    }
                }
            }
        }
    }
    Item{
        width: application.width > application.height ? parent.width*0.56 : parent.width
        height: application.width > application.height ? parent.height : parent.height*0.6
        Rectangle {
            anchors.centerIn: parent
            width: parent.width*0.9
            height: parent.height*0.9
            radius: 12
            color: Material.dialogColor
            border.color: Material.theme === Material.Light ? "#EDEDED" : "#525252"
            border.width: 1.4
            Text{
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.leftMargin: 32
                anchors.topMargin: 16
                font.pixelSize: 18
                font.bold: true
                color: Material.foreground
                text: listmodel.get(listview.currentIndex)._title
            }
            Loader{
                id: loader
                visible: status == Loader.Ready
                Material.accent: Material.theme === Material.Light ? AppSettings.accent : Qt.lighter(AppSettings.accent, 1.618)
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 48
                width: parent.width - 32
                height: parent.height - 64
                asynchronous: true
                Component.onCompleted: loaderItem(0)
            }
        }
    }
    function loaderItem(index){
        loader.sourceComponent = objectmodel.get(index)
    }
}
