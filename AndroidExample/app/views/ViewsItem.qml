import QtQuick
import QtQuick.Controls
import "qrc:/app/+MaterialInterface" as M
import "qrc:/app/views/+impl" as IMPL

M.QuickDemoPage {
    title: "CubeQuick - Views"
    M.QuickDemoItem{ }
    ListModel{
        id: listmodel
        ListElement{
            _title: "GridView"
            _author: "Author:  QT Team"
            _version: "Version:  ---"
            _itemicon: "qrc:/res/svg/icon-message.svg"
        }
        ListElement{
            _title: "ListView"
            _author: "Author:  QT Team"
            _version: "Version:  ---"
            _itemicon: "qrc:/res/svg/icon-message.svg"
        }
        ListElement{
            _title: "ScrollView"
            _author: "Author:  QT Team"
            _version: "Version:  ---"
            _itemicon: "qrc:/res/svg/icon-message.svg"
        }

        ListElement{
            _title: "SplitView"
            _author: "Author:  QT Team"
            _version: "Version:  ---"
            _itemicon: "qrc:/res/svg/icon-message.svg"
        }
        ListElement{
            _title: "StackView"
            _author: "Author:  QT Team"
            _version: "Version:  ---"
            _itemicon: "qrc:/res/svg/icon-message.svg"
        }
        ListElement{
            _title: "SwipeView"
            _author: "Author:  QT Team"
            _version: "Version:  ---"
            _itemicon: "qrc:/res/svg/icon-message.svg"
        }
    }
    ObjectModel{
        id: objectmodel
        Component{
            M.QuickDemoView{
               Item{
                   GridView{
                       id: gridview
                       anchors.fill: parent
                       anchors.margins: 16
                       cellWidth: width/4
                       cellHeight: width/4
                       model: 36
                       delegate: Item{
                           height: gridview.cellHeight
                           width: gridview.cellWidth
                           Frame{
                               anchors.fill: parent
                               anchors.margins: 2
                               Text{
                                   anchors.centerIn: parent
                                   text: "View - "+(index+1)
                                   font.bold: true
                                   color: Material.foreground
                               }
                           }
                       }
                   }
               }
            }
        }
        Component{
            M.QuickDemoView{
               Item{
                   ListView{
                       id: listview1
                       anchors.fill: parent
                       anchors.margins: 16
                       clip: true
                       spacing: 8
                       model: 12
                       delegate: Rectangle{
                           width: listview1.width
                           height: 64
                           radius: 4
                           color: Material.dialogColor
                           border.color: "#8A8A8A"
                           Text{
                               anchors.centerIn: parent
                               font.bold: true
                               color: Material.foreground
                               text: "View - "+(index+1)
                           }
                       }
                   }
               }
            }
        }
        Component{
            M.QuickDemoView{
                Item{
                    Rectangle{
                        anchors.fill: parent
                        anchors.margins: 16
                        border.color: "#8A8A8A"
                        color: Material.dialogColor
                        radius: 4
                        ScrollView{
                            id: scrollview
                            anchors.fill: parent
                            contentHeight: parent.height+128
                            contentWidth: (parent.height+128)*1.4
                            Image{
                                 anchors.centerIn: parent
                                 fillMode: Image.PreserveAspectFit
                                 sourceSize: Qt.size(scrollview.width,scrollview.height)
                                 source: "qrc:/res/svg/logo-qt.svg"
                            }
                        }
                    }
                }
            }
        }
        Component{
            M.QuickDemoView{
                Item{
                    SplitView{
                        anchors.fill: parent
                        anchors.margins: 16
                        Rectangle {
                            implicitWidth: parent.width*0.4
                            color: Material.dialogColor
                            border.color: "#8A8A8A"
                            radius: 4
                            clip: true
                            Text{
                                anchors.centerIn: parent
                                text: "View - 1"
                                font.bold: true
                                color: Material.foreground
                            }
                        }
                        SplitView{
                            implicitWidth: parent.width*0.6
                            orientation: Qt.Vertical
                            Rectangle {
                                 implicitHeight: parent.height*0.5
                                 color: Material.dialogColor
                                 border.color: "#8A8A8A"
                                 radius: 4
                                 clip: true
                                 Text{
                                     anchors.centerIn: parent
                                     text: "View - 2"
                                     font.bold: true
                                     color: Material.foreground
                                 }
                            }
                            Rectangle {
                                 implicitHeight: parent.height*0.5
                                 color: Material.dialogColor
                                 border.color: "#8A8A8A"
                                 radius: 4
                                 clip: true
                                 Text{
                                     anchors.centerIn: parent
                                     text: "View - 3"
                                     font.bold: true
                                     color: Material.foreground
                                 }
                            }
                        }
                    }
                }
            }
        }
        Component{
            M.QuickDemoView{
                Item{
                    StackView{
                        id:stackview
                        anchors.fill: parent
                        anchors.margins: 16
                        initialItem: stackviewpage
                        IMPL.StackViewObject{
                            id: stackviewpage
                        }
                    }
                }
            }
        }
        Component{
            M.QuickDemoView{
               Item{
                  Rectangle{
                      anchors.fill: parent
                      anchors.margins: 16
                      border.color: "#8A8A8A"
                      color: Material.dialogColor
                      radius: 4
                      SwipeView {
                          id: swipview
                          anchors.fill: parent
                          currentIndex : 2
                          clip: true
                          Repeater {
                              model: 5
                              Item {
                                  width: swipview.width
                                  height: swipview.height
                                  Column {
                                      spacing:  swipview.height*0.15
                                      anchors.centerIn: parent
                                      Text{
                                          anchors.horizontalCenter: parent.horizontalCenter
                                          font.bold: true
                                          color: Material.foreground
                                          text: "View - "+(index+1)
                                      }
                                      Image {
                                          anchors.horizontalCenter: parent.horizontalCenter
                                          fillMode: Image.PreserveAspectFit
                                          width: 72
                                          source: "qrc:/res/png/arrows.png"
                                      }
                                  }
                                  Component.onCompleted: swipview.currentIndex = 0
                              }
                          }
                      }
                      PageIndicator {
                          count: swipview.count
                          currentIndex: swipview.currentIndex
                          anchors.bottom: parent.bottom
                          anchors.horizontalCenter: parent.horizontalCenter
                      }
                  }
               }
            }
        }
    }
}
