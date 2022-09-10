import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import CubeQuick.Controls
import "qrc:/app/settings"

Item {
     id: root
     anchors.fill: parent
     ListView{
        id: listview
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: application.width > application.height ? 160 : 0
        anchors.rightMargin: 0
        height: parent.height
        model: listmodel
        spacing: 16
        header: Item{
            visible: application.width < application.height
            height: application.width > application.height ? 16 : 200
            width:  listview.width
            CubeElevationRectangle{
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.topMargin: 20
                anchors.bottomMargin: 20
                anchors.leftMargin: 20
                width: application.width > application.height ? parent.width*0.5 : parent.width - 40
                radius: 12
                elevation: 12
                color: "#09102B"
                Image {
                    id : viewImage
                    anchors.top: parent.top
                    anchors.topMargin: 16
                    height: parent.height-16
                    width: height
                    source: "qrc:/res/png/view2.png"
                }
                Text{
                    anchors.left: viewImage.right
                    anchors.bottom: viewImage.bottom
                    anchors.bottomMargin: 24
                    font.bold: true
                    font.italic: true
                    font.pixelSize: 10
                    color: "#AFAFAF"
                    text: "One framework.  一个框架.\nOne codebase.  一份代码库.\nAny platform.  任意平台部署."
                }
                Image {
                    id : qtImage
                    anchors.top: parent.top
                    anchors.left: viewImage.right
                    anchors.topMargin: 24
                    fillMode: Image.PreserveAspectFit
                    sourceSize: Qt.size(48,48)
                    source: "qrc:/res/svg/logo-qt.svg"
                }
                Text{
                    anchors.left: qtImage.right
                    anchors.top: qtImage.top
                    anchors.leftMargin: 16
                    anchors.topMargin: 4
                    font.bold: true
                    font.pixelSize: 14
                    color: "#F0F0F0"
                    text: "A n d r o i d"
                }
                Text{
                    anchors.left: qtImage.right
                    anchors.bottom: qtImage.bottom
                    anchors.bottomMargin: 4
                    anchors.leftMargin: 16
                    font.bold: true
                    font.pixelSize: 10
                    color: "#F0F0F0"
                    text: "- Built width Qt -"
                }
            }
        }
        delegate: listviewItem
        footer: Item{width: listview.width; height: 16}
     }
     Loader{
         anchors.verticalCenter: parent.verticalCenter
         anchors.left: parent.left
         anchors.leftMargin: 20
         width: 140
         height: parent.height - 32
         asynchronous: true
         sourceComponent: application.width > application.height ? component_android_gif : undefined
     }
     Component{
         id: listviewItem
         Item{
             height: application.width > application.height ? 120 : 160
             width: listview.width
             Rectangle{
                 id : rect
                 anchors.left: parent.left
                 anchors.leftMargin: 20
                 height: parent.height
                 width: application.width > application.height ? 160 : 120
                 radius: 10
                 LinearGradient {
                      anchors.fill: parent
                      source: rect
                      start: Qt.point(0, 0)
                      end: Qt.point(width, height)
                      gradient: Gradient {
                          GradientStop {  position: 0.0; color: _color0}
                          GradientStop {  position: 1.0; color: _color1}
                      }
                 }
                 Rectangle{
                     anchors.right: parent.right
                     anchors.top: parent.top
                     anchors.rightMargin: -0.1
                     anchors.topMargin: -0.1
                     width: 48
                     height: 24
                     radius: 8
                     color: "#1F1F1F"
                     Text{
                         anchors.centerIn: parent
                         font.bold: true
                         font.pixelSize: 10
                         font.italic: true
                         color: _tcolor
                         text: _type
                     }
                 }
                 Text{
                     anchors.centerIn: parent
                     font.bold: true
                     color: "#FFFFFF"
                     text: _title
                 }
                 Text{
                     anchors.left: parent.left
                     anchors.leftMargin: 8
                     anchors.bottom: parent.bottom
                     anchors.bottomMargin: 8
                     font.pixelSize: 8
                     font.bold: true
                     color: "#FFFFFF"
                     text: _class
                 }
                 MouseArea{
                     anchors.fill: parent
                     onClicked: {
                         AppActivities.clickedActivity(0)
                         application.stackviewPUSH(objectmodel.get(index))
                     }
                 }
             }
             Column{
                 anchors.left: rect.right
                 anchors.right: parent.right
                 anchors.top: parent.top
                 anchors.leftMargin: 16
                 anchors.rightMargin: 20
                 Text{
                     font.pixelSize: 16
                     font.bold: true
                     color: Material.foreground
                     text: _title
                 }
                 Text{
                     font.bold: true
                     color: Material.foreground
                     text: _register
                 }
                 Item{width: 1; height: 8}
                 Text{
                     width: parent.width
                     wrapMode: Text.WrapAnywhere
                     verticalAlignment: Text.AlignVCenter
                     color: "#8A8A8A"
                     text: _introduction
                 }
             }
             Rectangle{
                 anchors.left: rect.right
                 anchors.bottom: parent.bottom
                 anchors.leftMargin: 16
                 width: defineText.width+height
                 height: 20
                 radius: 10
                 LinearGradient {
                     anchors.fill: parent
                     source: parent
                     start: Qt.point(0, 0)
                     end: Qt.point(width, 0)
                      gradient: Gradient {
                          GradientStop {  position: 1.0; color: _color0}
                          GradientStop {  position: 0.0; color: _color1}
                      }
                 }
                 Text{
                     id: defineText
                     anchors.centerIn: parent
                     color: "#FFFFFF"
                     font.pixelSize: 10
                     font.bold: true
                     font.italic: true
                     text: _macro
                 }
             }
         }
     }
     Component{
         id : component_android_gif
         Rectangle{
             radius: 12
             color: "#000000"
             AnimatedImage{
                 anchors.centerIn: parent
                 width: parent.height - 64
                 height: width*0.6
                 rotation: - 90
                 cache: false
                 source: "qrc:/res/gif/new-android.gif"
             }
             Text{
                 anchors.top: parent.top
                 anchors.topMargin: 12
                 anchors.horizontalCenter: parent.horizontalCenter
                 font.bold: true
                 color: "#FFFFFF"
                 text: " A n d r o i d"
             }
             Text{
                 anchors.bottom: parent.bottom
                 anchors.left: parent.left
                 anchors.bottomMargin: 8
                 anchors.leftMargin: 8
                 font.bold: true
                 font.pixelSize: 10
                 color: "#FFFFFF"
                 text: "- Built with Qt -"
             }
         }
     }
}
