import QtQuick
import QtQuick.Controls.Material
import CubeQuick.Views.PathView
import "qrc:/app/+MaterialInterface" as M
import "qrc:/app/views/+impl" as IMPL

M.QuickDemoPage {
    title: "Views - PathView"
    M.QuickDemoItem{}
    ListModel{
        id: listmodel
        ListElement{
            _title: "2DCarousel"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-path.svg"
        }
        ListElement{
            _title: "3DCarousel"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-path.svg"
        }
    }
    ObjectModel{
        id: objectmodel
        Component{
            M.QuickDemoView{
                Item{
                    Cube2DCarousel {
                        anchors.fill: parent
                        model:  IMPL.ViewsConfigs._2DCarouselModel
                        delegate: Item{
                            id: item_2DCarousel
                            Row{
                                anchors.centerIn: parent
                                Column{
                                    spacing: 8
                                    Text{
                                        width: item_2DCarousel.width*0.5
                                        font.pixelSize: 12
                                        font.bold: true
                                        color: Material.foreground
                                        wrapMode: Text.WrapAnywhere
                                        verticalAlignment: Text.AlignVCenter
                                        text: keywords
                                    }
                                    Text{
                                        width: item_2DCarousel.width*0.5
                                        font.pixelSize: 16
                                        font.bold: true
                                        color: Material.foreground
                                        wrapMode: Text.WrapAnywhere
                                        verticalAlignment: Text.AlignVCenter
                                        text: title
                                    }
                                    Text{
                                        width: item_2DCarousel.width*0.5
                                        font.pixelSize: 10
                                        color:"#8A8A8A"
                                        wrapMode: Text.WrapAnywhere
                                        verticalAlignment: Text.AlignVCenter
                                        text: content
                                    }
                                }
                                Item{
                                     anchors.verticalCenter: parent.verticalCenter
                                    width: item_2DCarousel.width*0.5
                                    height: 1
                                    Image{
                                        anchors.verticalCenter: parent.verticalCenter
                                        width: item_2DCarousel.width*0.5
                                        fillMode: Image.PreserveAspectFit
                                        source: imgUrl
                                        asynchronous: true
                                        cache: false
                                    }
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
                   Cube3DCarousel {
                       anchors.centerIn: parent
                       width: parent.width
                       height: parent.width*0.6
                       itemCount: 3
                       model: IMPL.ViewsConfigs._3DCarouselModel
                       delegate: Rectangle {
                           id: item_3DCarousel
                           z: PathView.iconZ
                           scale :PathView.iconScale
                           width: parent.width*0.5
                           height: parent.width*0.5
                           radius: 4
                           border.color: Material.accentColor
                           color: "#FAFAFA"
                           transform: Rotation{
                               origin.x:item_3DCarousel.width/2.0
                               origin.y:item_3DCarousel.height/4.0
                               axis{ x:0; y:1; z:0; }
                               angle: item_3DCarousel.PathView.iconAngle
                           }
                           Column{
                               width: parent.width
                               anchors.verticalCenter: parent.verticalCenter
                               spacing: 12
                               Image{
                                   anchors.horizontalCenter: parent.horizontalCenter
                                   sourceSize: Qt.size(item_3DCarousel.width*0.5, item_3DCarousel.width*0.5)
                                   fillMode: Image.PreserveAspectFit
                                   source: imgUrl
                               }
                               Text{
                                   anchors.horizontalCenter: parent.horizontalCenter
                                   font.bold: true
                                   font.pixelSize: 16
                                   color: "#323232"
                                   text: title
                               }
                           }
                       }
                   }
                }
            }
        }
    }
}
