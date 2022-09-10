import QtQuick
import QtQuick.Controls
import CubeQuick.Controls.Dialog
import "qrc:/app/+MaterialInterface" as M

M.QuickDemoPage {
    id: page
    title: "Controls - Dialog"
    M.QuickDemoItem{ }
    ListModel {
        id: listmodel
        ListElement{
            _title: "ColorDialog"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-message.svg"
        }
        ListElement{
            _title: "FontDialog"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-message.svg"
        }
        ListElement{
            _title: "MessageDialog"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-message.svg"
        }
    }
    ObjectModel {
        id: objectmodel
        Component{
            M.QuickDemoView{
                Item{
                    M.HighlightButton{
                        anchors.centerIn: parent
                        text: "Click me!"
                        onClicked: colorDialog.open()
                    }
                    CubeColorDialog{
                        id: colorDialog
                        parent: page
                        Material.accent: Material.theme === Material.Light ? application.Material.accent : Qt.lighter(application.Material.accent, 1.618)
                    }
                }
            }
        }
        Component{
            M.QuickDemoView{
                Item{
                    id: item_fontDialog
                    Column{
                        anchors.centerIn: parent
                        spacing: 12
                        M.HighlightButton{
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: "Click me!"
                            onClicked: fontDialog.open()
                        }
                        ScrollView {
                            id: scrollview
                            anchors.horizontalCenter: parent.horizontalCenter
                            height:  text_fontDialog.height
                            width:  item_fontDialog.width - 16
                            Text{
                                id: text_fontDialog
                                x: (scrollview.width - width >0) ? (scrollview.width - width )/2 : 0
                                text: "字体 Font"
                                color: Material.foreground
                            }
                        }
                    }
                    CubeFontDialog{
                        id: fontDialog
                        parent: page
                        Material.accent: Material.theme === Material.Light ? application.Material.accent : Qt.lighter(application.Material.accent, 1.618)
                        onAccepted:  text_fontDialog.font = currentFont
                    }
                }
            }
        }
        Component{
            M.QuickDemoView{
                Item{
                    Flow{
                        id: flow_messageDialog1
                        anchors.left: parent.left
                        anchors.leftMargin: 8
                        width: parent.width - 8
                        Text{
                            width: parent.width
                            color: Material.foreground
                            font.bold: true
                            font.pixelSize: 14
                            text: "- 组件深度 -"
                        }
                        Row{
                            spacing: 4
                            Slider{
                                from: 0
                                to: 100
                                value: 0
                                onValueChanged: {
                                    messageDialog1.Material.elevation = value
                                    text_messageDialog1.text = "elevation: " +value.toFixed(0)
                                }
                            }
                            Text{
                                id: text_messageDialog1
                                anchors.verticalCenter: parent.verticalCenter
                                color: Material.foreground
                                font.bold: true
                                text: "elevation: 0"
                            }
                        }
                    }
                    Item{
                        anchors.bottom: parent.bottom
                        anchors.top: flow_messageDialog1.bottom
                        anchors.topMargin: -32
                        width: parent.width
                        M.HighlightButton{
                            anchors.centerIn: parent
                            text: "Click me!"
                            onClicked: messageDialog1.open()
                        }
                    }
                    CubeMessageDialog{
                        id: messageDialog1
                        parent: page
                        text: "Hello,World! Here is an example set of messages.\n你好,世界! 这是一组消息示例."
                    }
                }
                Item{
                    Flow{
                        id: flow_messageDialog2
                        anchors.left: parent.left
                        anchors.leftMargin: 8
                        width: parent.width - 8
                        Text{
                            width: parent.width
                            color: Material.foreground
                            font.bold: true
                            font.pixelSize: 14
                            text: "- 组件深度 -"
                        }
                        Row{
                            spacing: 4
                            Slider{
                                from: 0
                                to: 100
                                value: 0
                                onValueChanged: {
                                    messageDialog2.Material.elevation = value
                                    text_messageDialog2.text = "elevation: " + value.toFixed(0)
                                }
                            }
                            Text{
                                id: text_messageDialog2
                                anchors.verticalCenter: parent.verticalCenter
                                color: Material.foreground
                                font.bold: true
                                text: "elevation: 0"
                            }
                        }
                    }
                    Item{
                        anchors.bottom: parent.bottom
                        anchors.top: flow_messageDialog2.bottom
                        anchors.topMargin: -32
                        width: parent.width
                        Column{
                            anchors.centerIn: parent
                            spacing: 12
                            M.HighlightButton{
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: "Click me!"
                                onClicked: messageDialog2.open()
                            }
                            Text{
                                id: text2_messageDialog2
                                text: "你的选择: 未选择"
                                font.bold: true
                                color: Material.foreground
                            }
                        }
                    }
                    CubeMessageDialog{
                        id: messageDialog2
                        parent: page
                        Material.accent: Material.theme === Material.Light ? application.Material.accent : Qt.lighter(application.Material.accent, 1.618)
                        text: "Hello,World! Here is a sample set of messages with interactive buttons.\n你好,世界! 这是一组带有交互按钮的消息示例."
                        standardButtons: Dialog.Ok | Dialog.Cancel
                        onAccepted: text2_messageDialog2.text = "你的选择: OK"
                        onRejected: text2_messageDialog2.text = "你的选择: Cancel"
                    }
                }
            }
        }
    }
}
