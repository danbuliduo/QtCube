import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import CubeQuick.Controls
import "qrc:/app/settings/"

Component{
    Item{
        width: application.width > application.height ? (listview.width - listview.spacing)/2 : listview.width
        height: application.width > application.height ? listview.height -24  : 200
        QtStyleLable{
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - 40
            height: 40
            Image {
                sourceSize: Qt.size(40,40)
                source: "qrc:/res/svg/logo-qt.svg"
                fillMode: Image.PreserveAspectFit
            }
            Text{
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 72
                font.bold: true
                font.pixelSize: 13
                color: "#FFFFFF"
                text:  index ===0 ? title : title+"."+_title
            }
        }
        Row{
            id: row
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            width: parent.width - 40
            height: application.width > application.height ? parent.height - 56 : 150
            spacing: 16
            Item{
                width: row.width/3
                height: row.height
                CubeGlowRectangle{
                    anchors.fill: parent
                    radius: 6
                    color: Material.dialogColor
                    glowRadius: 2
                    glowColor: "#41CD52"
                    Text{
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.leftMargin: 12
                        anchors.topMargin: 8
                        font.bold: true
                        font.pixelSize: 10
                        color: Material.foreground
                        text:  _title
                    }
                    ColorImage{
                        anchors.centerIn: parent
                        sourceSize: Qt.size(parent.height/3,parent.height/3)
                        source: _icon
                        cache: false
                        color: Material.theme === Material.Light ? "#222840" : "#DFDFDF"
                    }
                    Text{
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: 12
                        anchors.bottomMargin: 8
                        font.bold: true
                        font.pixelSize: 10
                        color: Material.foreground
                        text: "Version: "+_version
                    }
                }
            }
            Item{
                width: row.width*2/3 - row.spacing
                height: row.height
                Column{
                    width: parent.width
                    spacing: 8
                    Text{
                        font.bold: true
                        font.pixelSize: 14
                        color: Material.foreground
                        text: _name
                    }
                    Text{
                        width: parent.width
                        color: "#8A8A8A"
                        wrapMode: Text.WrapAnywhere
                        verticalAlignment: Text.AlignVCenter
                        text: _introduction +"..."
                    }
                }
                QtStyleLable{
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 16
                    width: parent.width*0.8
                    height: 36
                    fillcolor: "#41CD52"
                    scale: mouseArea.pressed ? 0.8 : 1.0
                   /* ScaleAnimator{
                         id:animation
                         target: parent
                         duration: 200
                         easing.type: Easing.OutBounce
                         from: 0.8
                         to: 1
                     }*/
                    RectangularGlow{
                        anchors.centerIn: parent
                        width: parent.width - 8
                        height: parent.height - 2
                        cached: false
                        spread: 0.2
                        color: "#41CD52"
                        glowRadius: 6
                        cornerRadius: 14
                    }
                    IconLabel{
                        anchors.centerIn: parent
                        icon.source: "qrc:/res/svg/icon-rightarrow.svg"
                        icon.color: "#FFFFFF"
                        icon.width: 20
                        icon.height: 20
                        font.bold: true
                        font.pixelSize: 15
                        font.italic: true
                        text: " Go View Demo ! "
                        color: "#FFFFFF"
                    }
                    MouseArea{
                        id: mouseArea
                        anchors.fill: parent
                        onClicked: {
                            AppActivities.clickedActivity(0)
                           // animation.start()
                            application.stackviewPUSH(objectmodel.get(index))
                        }
                    }
                }
            }
        }
    }
}
