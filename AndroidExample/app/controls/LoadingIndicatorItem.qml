import QtQuick
import QtQuick.Controls
import CubeQuick.Controls.LoadingIndicator
import "qrc:/app/+MaterialInterface" as M

M.QuickDemoPage {
    title: "Controls - LoadingIndicator"
    M.QuickDemoItem{ }
    ListModel{
        id: listmodel
        ListElement{
            _title: "BusyIndicator"
            _author: "Author:  QT Team"
            _version: "Version:  ---"
            _itemicon: "qrc:/res/svg/icon-loading.svg"
        }
        ListElement{
            _title: "FlipBlockIndicator"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-loading.svg"
        }
        ListElement{
            _title: "GradientCircleIndicator"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-loading.svg"
        }
        ListElement{
            _title: "PulseBlocksIndicator"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-loading.svg"
        }
        ListElement{
            _title: "QuickLoadingIndicator"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-loading.svg"
        }
        ListElement{
            _title: "TopplingBlocksIndicator"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-loading.svg"
        }
    }

    ObjectModel{
        id: objectmodel
        Component{
            M.QuickDemoView{
                Item{
                    BusyIndicator {
                         anchors.centerIn: parent
                         width: implicitWidth * Math.min(parent.height,parent.width)/128
                         height: implicitWidth * Math.min(parent.height,parent.width)/128
                    }
                }
            }
        }
        Component{
            M.QuickDemoView{
                Item{
                    CubeFlipBlockIndicator{
                        anchors.centerIn: parent
                        scale: Math.min(parent.height,parent.width)/128
                    }
                }
            }
        }
        Component{
            M.QuickDemoView{
               Item{
                   CubeGradientCircleIndicator{
                       anchors.centerIn: parent
                       width: implicitWidth * Math.min(parent.height,parent.width)/128
                       height: implicitWidth * Math.min(parent.height,parent.width)/128
                   }
                }
               Item{
                   CubeGradientCircleIndicator{
                       anchors.centerIn: parent
                       width: implicitWidth * Math.min(parent.height,parent.width)/128
                       height: implicitWidth * Math.min(parent.height,parent.width)/128
                       headerVisible: false
                       gradient: Gradient {
                           GradientStop { position: 0.000; color: Qt.rgba(1, 0, 0, 1); }
                           GradientStop { position: 0.167; color: Qt.rgba(1, 1, 0, 1); }
                           GradientStop { position: 0.333; color: Qt.rgba(0, 1, 0, 1); }
                           GradientStop { position: 0.500; color: Qt.rgba(0, 1, 1, 1); }
                           GradientStop { position: 0.667; color: Qt.rgba(0, 0, 1, 1); }
                           GradientStop { position: 0.833; color: Qt.rgba(1, 0, 1, 1); }
                           GradientStop { position: 1.000; color: Qt.rgba(1, 0, 0, 1); }
                       }
                   }
                }
            }
        }
        Component{
            M.QuickDemoView{
                Item{
                    CubePulseBlocksIndicator{
                        anchors.centerIn: parent
                        scale: Math.min(parent.height,parent.width)/128
                    }
                }
                Item{
                    CubePulseBlocksIndicator{
                        anchors.centerIn: parent
                        scale: Math.min(parent.height,parent.width)/128
                        colorArray: ["#4285F4","#EA4335","#FBBC05","#34A853"]
                    }
                }
                Item{
                    CubePulseBlocksIndicator{
                        modelSum: 8
                        frequency: 80
                        anchors.centerIn: parent
                        scale: Math.min(parent.height,parent.width)/128
                    }
                }
            }
        }
        Component{
            M.QuickDemoView{
               Item{
                   CubeQuickLoadingIndicator{
                       scale: Math.min(parent.height,parent.width)/128
                       anchors.centerIn: parent
                   }
               }
               Item{
                   CubeQuickLoadingIndicator{
                        scale: Math.min(parent.height,parent.width)/128
                        anchors.centerIn: parent
                        modelSum: 12
                   }
                }
            }
        }
        Component{
            M.QuickDemoView{
                Item{
                      CubeTopplingBlocksIndicator{
                          scale: Math.min(parent.height,parent.width)/128
                          anchors.centerIn: parent
                     }
                }
                Item{
                     CubeTopplingBlocksIndicator{
                         anchors.centerIn: parent
                         scale: Math.min(parent.height,parent.width)/128
                         colorArray: ["#4285F4","#EA4335","#FBBC05","#34A853"]
                     }
                }
            }
        }
    }
}
