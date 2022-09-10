import QtQuick
import QtQuick.Controls
import CubeAndroid.CoreX
import "qrc:/app/+MaterialInterface" as M

M.QuickDemoPage {
   title: "AndroidSystemController"
   M.QuickDemoItem{ icolor: "#32DE84"}
   ListModel{
       id: listmodel
       ListElement{
           _title: "Flashlight"
           _author: "Author:  TengMing"
           _version: "Version:  1.0"
           _itemicon: "qrc:/res/svg/icon-android.svg"
       }
       ListElement{
           _title: "ScreenBrightness"
           _author: "Author:  TengMing"
           _version: "Version:  1.0"
           _itemicon: "qrc:/res/svg/icon-android.svg"
       }
       ListElement{
           _title: "Vibrator"
           _author: "Author:  TengMing"
           _version: "Version:  1.0"
           _itemicon: "qrc:/res/svg/icon-android.svg"
       }
   }
   ListModel {
       id: vibratormodel
       ListElement{
           _text: "说明: 默认振动-触发产生一个200ms的默认振动\n构造: AndroidSystemController.setVibrator()"
       }
       ListElement{
           _text: "说明: 短振动-触发产生一个25ms的短时间振动\n构造: AndroidSystemController.setVibrator(25)"
       }
       ListElement{
           _text: "说明: 长振动-触发产生一个1000ms的长时间振动\n构造: AndroidSystemController.setVibrator(1000)"
       }
       ListElement{
           _text: "说明: 模式振动-触发产生有时间间隔的节奏性振动\n构造: AndroidSystemController.setVibrator([100,100,200,200,400,400,800,800,1600,1600])"
       }
       ListElement{
           _text: "说明: 周期振动-触发产生间隔200ms的周期性振动\n构造: AndroidSystemController.setVibrator([200,200],0)"
       }
       ListElement{
           _text: "说明: 取消振动-触发取消振动器振动\n构造: AndroidSystemController.cancelVibrator()"
       }
   }
   ObjectModel{
       id: objectmodel
       Component{
           M.QuickDemoView{
               Item{
                   Column{
                       spacing: 8
                       anchors.centerIn: parent
                       Switch{
                           font.bold: true
                           spacing: 16
                           text: checked ? "关闭手电筒 [CLOSE]" : "开启手电筒 [OPEN]"
                           onClicked:   AndroidSystemController.setFlashlight(checked)
                       }
                       Text{
                           font.pixelSize: 10
                           font.bold: true
                           font.italic: true
                           text: "构造: AndroidSystemController.setFlashlight(bool)"
                           color: "#8A8A8A"
                       }
                   }
               }
           }
       }
       Component {
           M.QuickDemoView{
               Item{
                   Column{
                       anchors.centerIn: parent
                       width: parent.width
                       spacing: 0
                       Row{
                           spacing: 8
                           anchors.horizontalCenter: parent.horizontalCenter
                           Text{
                               anchors.verticalCenter: parent.verticalCenter
                               text: "Slide:"
                               color: Material.foreground
                               font.bold: true
                           }
                           Slider{
                               id: slider
                               anchors.verticalCenter: parent.verticalCenter
                               value: 200
                               from: 0
                               to: 255
                               padding: 0
                               onValueChanged: AndroidSystemController.setWindowBrightness(value)
                               Component.onCompleted: AndroidSystemController.setWindowBrightness(value)
                           }
                       }
                       Text{
                           anchors.horizontalCenter: parent.horizontalCenter
                           text: "SlideValue: ["+slider.value.toFixed(2)+"]        屏幕相对亮度: " + (slider.value/2.55).toFixed(2)+ "%"
                           font.bold: true
                           color: Material.foreground
                       }
                       Text{
                           anchors.horizontalCenter: parent.horizontalCenter
                           text: "\n\n构造: AndroidSystemController.setWindowBrightness(real)"
                           font.pixelSize: 10
                           font.bold: true
                           font.italic: true
                           color: "#8A8A8A"
                       }
                   }
                   Text{
                       anchors.bottom: parent.bottom
                       text: "* setWindowBrightness()只作用于自身程序窗口且作用优先于系统屏幕亮度"
                       font.pixelSize: 8
                       color: "#8A8A8A"
                   }
               }
           }
       }
       Component{
           M.QuickDemoView{
               Item{
                   id: item_Vibrator1
                   property int duration : 200
                   Flow{
                       id: flow_Vibrator1
                       anchors.left: parent.left
                       anchors.leftMargin: 8
                       width: parent.width - 8
                       Text{
                           width: parent.width
                           color: Material.foreground
                           font.bold: true
                           font.pixelSize: 14
                           text: "- 振动时长 -"
                       }
                       Repeater{
                           model: [25,200,1000]
                           RadioButton{
                               spacing: 4
                               text: modelData + "ms"
                               checked: modelData === 200
                               onClicked: item_Vibrator1.duration = modelData
                           }
                       }
                   }
                   Item{
                       anchors.bottom: parent.bottom
                       anchors.top: flow_Vibrator1.bottom
                       anchors.topMargin: -32
                       width: parent.width
                       Column{
                           anchors.centerIn: parent
                           spacing: parent.height * 0.02
                           Row{
                               spacing: 12
                               M.HighlightButton{
                                  implicitWidth: 112
                                  text: "Start-Vibrator"
                                  onClicked: AndroidSystemController.setVibrator(item_Vibrator1.duration)
                               }
                               Text{
                                   anchors.verticalCenter: parent.verticalCenter
                                   color: Material.foreground
                                   font.bold: true
                                   text: {
                                       if(item_Vibrator1.duration ===200) return "开启默认振动 - 200ms "
                                       else if(item_Vibrator1.duration ===25) return "开启短振动 - 25ms  "
                                       else if(item_Vibrator1.duration ===1000) return "开启长振动 - 1000ms"
                                   }
                               }
                           }
                           Text{
                               font.bold: true
                               font.pixelSize: 10
                               color : "#8A8A8A"
                               text: "构造: AndroidSystemController.setVibrator(int)"
                           }
                           Row{
                               spacing: 12
                               M.HighlightButton{
                                  implicitWidth: 112
                                  text: "Cancel-Vibrator"
                                  onClicked: AndroidSystemController.cancelVibrator()
                               }
                               Text{
                                   anchors.verticalCenter: parent.verticalCenter
                                   color: Material.foreground
                                   font.bold: true
                                   text: "关闭振动器 - 停止振动活动"
                               }
                           }
                           Text{
                               font.bold: true
                               font.pixelSize: 10
                               color : "#8A8A8A"
                               text: "构造: AndroidSystemController.cancelVibrator()"
                           }
                       }
                   }
               }
               Item{
                   id: item_Vibrator2
                   property int vibratorfun: -1
                   Flow{
                       id: flow_Vibrator2
                       anchors.left: parent.left
                       anchors.leftMargin: 8
                       width: parent.width - 8
                       Text{
                           width: parent.width
                           color: Material.foreground
                           font.bold: true
                           font.pixelSize: 14
                           text: "- 振动模式 -"
                       }
                       RadioButton{
                           spacing: 4
                           text: "连续性振动"
                           checked:true
                           onClicked: item_Vibrator2.vibratorfun = -1
                       }
                       RadioButton{
                           spacing: 4
                           text: "循环性振动"
                           onClicked: item_Vibrator2.vibratorfun = 0
                       }
                   }
                   Item{
                       anchors.bottom: parent.bottom
                       anchors.top: flow_Vibrator2.bottom
                       anchors.topMargin: -32
                       width: parent.width
                       Column{
                           anchors.centerIn: parent
                           spacing: parent.height * 0.02
                           Row{
                               spacing: 12
                               M.HighlightButton{
                                  implicitWidth: 112
                                  text: "Start-Vibrator"
                                  onClicked: {
                                      if(item_Vibrator2.vibratorfun === -1){
                                          AndroidSystemController.setVibrator([100,100,200,200,400,400,800,800])
                                      }else{ AndroidSystemController.setVibrator([200,200],0)}
                                  }
                               }
                               Text{
                                   anchors.verticalCenter: parent.verticalCenter
                                   color: Material.foreground
                                   font.bold: true
                                   text: item_Vibrator2.vibratorfun === -1 ? "开启连续振动 - 连续4次" : "开启循环振动 - 间隔200ms"
                               }
                           }
                           Text{
                               font.bold: true
                               font.pixelSize: 10
                               color : "#8A8A8A"
                               text: "构造: AndroidSystemController.setVibrator(<int>[...], int)"
                           }
                           Row{
                               spacing: 12
                               M.HighlightButton{
                                  implicitWidth: 112
                                  text: "Cancel-Vibrator"
                                  onClicked: AndroidSystemController.cancelVibrator()
                               }
                               Text{
                                   anchors.verticalCenter: parent.verticalCenter
                                   color: Material.foreground
                                   font.bold: true
                                   text: "关闭振动器 - 停止振动活动"
                               }
                           }
                           Text{
                               font.bold: true
                               font.pixelSize: 10
                               color : "#8A8A8A"
                               text: "构造: AndroidSystemController.cancelVibrator()"
                           }
                       }
                   }
               }
           }
       }
   }
}
