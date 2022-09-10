import QtQuick
import QtQuick.Controls
import CubeAndroid.CoreX
import "qrc:/app/+MaterialInterface" as M

M.QuickDemoPage {
    title: "AndroidNotification"
    M.QuickDemoItem{ icolor: "#32DE84"}
    ListModel{
        id: listmodel
        ListElement{
            _title: "SystemNotification"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-android.svg"
        }
    }
    ObjectModel{
        id: objectmodel
        Component{
            M.QuickDemoView{
                Item{
                    Grid{
                        anchors.centerIn: parent
                        verticalItemAlignment: Grid.AlignVCenter
                        columnSpacing: 16
                        rowSpacing: 16
                        columns: 2
                        rows: 2
                        M.HighlightButton{
                            implicitWidth: 92
                            text: "StartNotify"
                            onClicked: notification1.startNotify()
                        }
                        Text{
                           font.bold: true
                           color: "#8A8A8A"
                           font.pixelSize: 14
                           text: "最小组成的通知栏"
                        }
                        Button{
                            implicitWidth: 92
                            font.bold: true
                            font.capitalization:  Font.MixedCase
                            text: "CancelNotify"
                            onClicked: notification1.cancelNotify()
                        }
                        Text{
                           font.bold: true
                           color: "#8A8A8A"
                           font.pixelSize: 14
                           text: "取消通知栏通知"
                        }
                    }
                    AndroidNotification{
                        id: notification1
                        channelName: "Notification1"
                        contentTitle: "QtCube-N1"
                        contentText: "Hello, QtCube! ❤️❤️❤️"
                        smallIconR: "icon"
                        Component.onDestruction: notification1.deleteChannel()
                    }
                }
                Item{
                    Grid{
                        anchors.centerIn: parent
                        verticalItemAlignment: Grid.AlignVCenter
                        columnSpacing: 16
                        rowSpacing: 16
                        columns: 2
                        rows: 2
                        M.HighlightButton{
                            implicitWidth: 92
                            text: "StartNotify"
                            onClicked: notification2.startNotify()
                        }
                        Text{
                           font.bold: true
                           color: "#8A8A8A"
                           font.pixelSize: 14
                           text: "带有图标的系统通知栏"
                        }
                       Button{
                            implicitWidth: 92
                            font.bold: true
                            font.capitalization:  Font.MixedCase
                            text: "CancelNotify"
                            onClicked: notification2.cancelNotify()
                        }
                        Text{
                           font.bold: true
                           color: "#8A8A8A"
                           font.pixelSize: 14
                           text: "取消通知栏通知"
                        }
                    }
                    AndroidNotification{
                        id: notification2
                        channelName: "Notification2"
                        contentTitle: "QtCube-N2"
                        contentText: "带有图标的通知栏"
                        smallIconR: "icon"
                        largeIconR: "icon"
                        Component.onDestruction: notification2.deleteChannel()
                    }
                }
                Item{
                    Grid{
                        anchors.centerIn: parent
                        verticalItemAlignment: Grid.AlignVCenter
                        columnSpacing: 16
                        rowSpacing: 16
                        columns: 2
                        rows: 2
                        M.HighlightButton{
                            implicitWidth: 92
                            text: "StartNotify"
                            onClicked: notification3.startNotify()
                        }
                        Text{
                           font.bold: true
                           color: "#8A8A8A"
                           font.pixelSize: 14
                           text: "长文字风格通知栏"
                        }
                        Button{
                            implicitWidth: 92
                            font.bold: true
                            font.capitalization:  Font.MixedCase
                            text: "CancelNotify"
                            onClicked: notification3.cancelNotify()
                        }
                        Text{
                           font.bold: true
                           color: "#8A8A8A"
                           font.pixelSize: 14
                           text: "取消通知栏通知"
                        }
                    }
                    AndroidNotification{
                        id: notification3
                        channelName: "Notification3"
                        contentTitle: "QtCube-N3"
                        smallIconR: "icon"
                        flagWhen: true
                        bigText: "带有时间标志的长文字通知栏\n"
                                 +"春江潮水连海平，海上明月共潮生。\n滟滟随波千万里，何处春江无月明！\n"
                                 +"江流宛转绕芳甸，月照花林皆似霰。\n空里流霜不觉飞，汀上白沙看不见。\n"
                                 +"江天一色无纤尘，皎皎空中孤月轮。\n江畔何人初见月？江月何年初照人？\n"
                                 +"人生代代无穷已，江月年年望相似。\n不知江月待何人，但见长江送流水。\n"
                                 +"白云一片去悠悠，青枫浦上不胜愁。\n谁家今夜扁舟子？何处相思明月楼？\n"
                                 +"可怜楼上月徘徊，应照离人妆镜台。\n玉户帘中卷不去，捣衣砧上拂还来。\n"
                                 +"此时相望不相闻，愿逐月华流照君。"
                        Component.onDestruction: notification3.deleteChannel()
                    }
                }
                Item{
                    Grid{
                        anchors.centerIn: parent
                        verticalItemAlignment: Grid.AlignVCenter
                        columnSpacing: 16
                        rowSpacing: 16
                        columns: 2
                        rows: 2
                        M.HighlightButton{
                            implicitWidth: 92
                            text: "StartNotify"
                            onClicked: progressTimer.start()
                        }
                        Text{
                           font.bold: true
                           color: "#8A8A8A"
                           font.pixelSize: 14
                           text: "进度条样式通知栏"
                        }
                        Button{
                            implicitWidth: 92
                            font.bold: true
                            font.capitalization:  Font.MixedCase
                            text: "CancelNotify"
                            onClicked: {
                                progressTimer.stop()
                                notification4.cancelNotify()
                            }
                        }
                        Text{
                           font.bold: true
                           color: "#8A8A8A"
                           font.pixelSize: 14
                           text: "取消通知栏通知"
                        }
                    }
                    AndroidNotification{
                        id: notification4
                        channelName: "Notification4"
                        contentTitle: "QtCube-N4"
                        contentText: "带有进度条的通知栏[1%]"
                        smallIconR: "icon"
                        progressBar.value: 1
                        Component.onDestruction: notification4.deleteChannel()
                    }
                    Timer{
                        id: progressTimer
                        property bool progressStatus: true
                        repeat: true
                        interval: 250
                        onTriggered: {
                            notification4.contentText = "带有进度条的通知栏["+notification4.progressBar.value +"%]"
                            notification4.startNotify()
                            if(notification4.progressBar.value === 100 || notification4.progressBar.value === 0){
                                progressStatus = ! progressStatus
                            }
                            progressStatus ? notification4.progressBar.value++ : notification4.progressBar.value--
                        }
                    }
                }
            }
        }
    }
}
