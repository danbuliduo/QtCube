import QtQuick
import QtQuick.Controls.Material
import CubeQuick.Controls
import "qrc:/app/+MaterialInterface" as M

M.QuickDemoPage {
    title: "CubeQuick - Controls"
    M.QuickDemoItem{ }
    ListModel{
        id: listmodel
        ListElement{
            _title: "ElevationRectangle"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-component.svg"
        }
        ListElement{
            _title: "FastBlurItem"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-component.svg"
        }
        ListElement{
            _title: "GlowRectangle"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-component.svg"
        }
        ListElement{
            _title: "OpacityMaskItem"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-component.svg"
        }
        ListElement{
            _title: "TabBar"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-component.svg"
        }
        ListElement{
            _title: "TabButton"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-component.svg"
        }
    }
    ObjectModel{
        id: objectmodel
        Component{
            M.QuickDemoView{
               Item{
                   Column{
                       id: column_ElevationRectangle
                       anchors.left: parent.left
                       anchors.leftMargin: 8
                       width: parent.width - 8
                       spacing: -16
                       Row{
                           spacing: 12
                           Text{
                               anchors.verticalCenter: parent.verticalCenter
                               color: Material.foreground
                               font.bold: true
                               font.pixelSize: 14
                               text: "- 阴影深度 -"
                           }
                           Slider{
                               from: 0
                               to: 128
                               value: 8
                               onValueChanged: elevationRectangle.elevation = value
                           }
                       }
                       Row{
                           spacing: 12
                           Text{
                               anchors.verticalCenter: parent.verticalCenter
                               color: Material.foreground
                               font.bold: true
                               font.pixelSize: 14
                               text: "- 圆角半径 -"
                           }
                           Slider{
                               from: 0
                               to: elevationRectangle.width/2
                               value: 8
                               onValueChanged: elevationRectangle.radius= value
                           }
                       }
                   }
                   Item{
                       anchors.bottom: parent.bottom
                       anchors.top: column_ElevationRectangle.bottom
                       anchors.topMargin: -32
                       width: parent.width
                       CubeElevationRectangle{
                           id: elevationRectangle
                           anchors.centerIn: parent
                           width: Math.min(parent.width,parent.height)*0.7
                           height: Math.min(parent.width,parent.height)*0.7
                           radius: 8
                           color: Material.theme === Material.Light ? "#EDEDED" : "#5E5E5E"
                       }
                   }
               }
            }
        }
        Component{
            Item{
                Column{
                    id: column_FastBlurItem
                    anchors.left: parent.left
                    anchors.leftMargin: 8
                    width: parent.width - 8
                    spacing: -16
                    Row{
                        spacing: 12
                        Text{
                            anchors.verticalCenter: parent.verticalCenter
                            color: Material.foreground
                            font.bold: true
                            font.pixelSize: 14
                            text: "- 模糊半径 -"
                        }
                        Slider{
                            from: 0
                            to: 64
                            onValueChanged: fastBlurItem.radius = value
                        }
                    }
                }
                Item{
                    anchors.bottom: parent.bottom
                    anchors.top: column_FastBlurItem.bottom
                    anchors.topMargin: -32
                    width: parent.width
                    CubeFastBlurItem{
                        id: fastBlurItem
                        anchors.centerIn: parent
                        width: Math.min(parent.width,parent.height)*0.7
                        height: Math.min(parent.width,parent.height)*0.7
                        Image{
                            anchors.fill: parent
                            cache: false
                            source: "qrc:/res/webp/starrysky.webp"
                        }
                        Text{
                            anchors.centerIn: parent
                            text: "This is a piece of text"
                            color: "#FFFFFF"
                            font.bold: true
                        }
                    }
                }
            }
        }
        Component{
            M.QuickDemoView{
               Item{
                   Column{
                       id: column_GlowRectangle
                       anchors.left: parent.left
                       anchors.leftMargin: 8
                       width: parent.width - 8
                       spacing: -16
                       Row{
                           spacing: 12
                           Text{
                               anchors.verticalCenter: parent.verticalCenter
                               color: Material.foreground
                               font.bold: true
                               font.pixelSize: 14
                               text: "- 辉光半径 -"
                           }
                           Slider{
                               from: 0
                               to: glowRectangle.width/3
                               value: 8
                               onValueChanged: glowRectangle.glowRadius = value
                           }
                       }
                       Row{
                           spacing: 12
                           Text{
                               anchors.verticalCenter: parent.verticalCenter
                               color: Material.foreground
                               font.bold: true
                               font.pixelSize: 14
                               text: "- 圆角半径 -"
                           }
                           Slider{
                               from: 0
                               to: glowRectangle.width/2
                               value: 8
                               onValueChanged: glowRectangle.radius= value
                           }
                       }
                   }
                   Item{
                       anchors.bottom: parent.bottom
                       anchors.top: column_GlowRectangle.bottom
                       anchors.topMargin: -32
                       width: parent.width
                       CubeGlowRectangle{
                           id: glowRectangle
                           anchors.centerIn: parent
                           width: Math.min(parent.width,parent.height)*0.7
                           height: Math.min(parent.width,parent.height)*0.7
                           radius: 8
                           glowRadius: 8
                           color: Material.theme === Material.Light ? "#EDEDED" : "#5E5E5E"
                           glowColor: Material.accentColor
                       }
                   }
               }
            }
        }
        Component{
            M.QuickDemoView{
                Item{
                    Column{
                        id: column_OpacityMaskItem
                        anchors.left: parent.left
                        anchors.leftMargin: 8
                        width: parent.width - 8
                        spacing: -16
                        Row{
                            spacing: 12
                            Text{
                                anchors.verticalCenter: parent.verticalCenter
                                color: Material.foreground
                                font.bold: true
                                font.pixelSize: 14
                                text: "- 遮掩半径 -"
                            }
                            Slider{
                                from: 0
                                to: opacityMaskItem.width/2
                                value: 4
                                onValueChanged: opacityMaskItem.maskRadius = value
                            }
                        }
                    }
                    Item{
                        anchors.bottom: parent.bottom
                        anchors.top: column_OpacityMaskItem.bottom
                        anchors.topMargin: -32
                        width: parent.width
                        CubeOpacityMaskItem{
                            id: opacityMaskItem
                            anchors.centerIn: parent
                            width: Math.min(parent.width,parent.height)*0.7
                            height: Math.min(parent.width,parent.height)*0.7
                            maskRadius: 4
                            Image{
                                anchors.fill: parent
                                cache: false
                                source: "qrc:/res/webp/starrysky.webp"
                            }
                        }
                    }
                }
            }
        }
        Component{
            M.QuickDemoView{
                Item{
                    CubeTabButton{
                        anchors.centerIn: parent
                        text: "TabButton"
                        icon.source: "qrc:/res/svg/logo-cube.svg"
                    }
                }
            }
        }
        Component{
            M.QuickDemoView{
               Item{

               }
            }
        }
        Component{
            M.QuickDemoView{

            }
        }
    }
}

/*    Row{
        anchors.centerIn: parent
        CuTabBar{
            id: cuTabBar
            currentIndex: swipeview.currentIndex
            orientation: ListView.Vertical
            Repeater{
                model: 4
                CuTabButton{
                   width: cuTabBar.contentWidth
                   icon.source: "qrc:/res/svg/icon-loading.svg"
                   text: "Page"+(index+1)
                   font.pixelSize: 12
               }
            }
        }
        SwipeView {
            id: swipeview
            width: 200
            height:  cuTabBar.height
            currentIndex: cuTabBar.currentIndex
            orientation: Qt.Vertical
            clip: true
            Repeater{
                model: 4
                Rectangle{Text{text: "PAGE"+(index+1);color: Material.foreground;anchors.centerIn: parent}}
            }
        }
        Column{
            CuCheckBox{
                text: "wrwerw"
                indicatorRect.radius: 9
            }
            CheckBox{
                text: "wrwerw"
            }
        }
    }*/
